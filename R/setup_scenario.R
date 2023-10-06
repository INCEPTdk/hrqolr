#' Helper for setting up valid scenarios
#'
#' Inputs are validated to ensure they produce the expected results when given as the input in
#' [simulate_trials]. Therefore, any arguments to this function can also be just a single value
#' (except the `arms` argument), and this function will expand such single-valued arguments to be
#' compatible with `simulate_trials`.
#'
#' @inheritParams simulate_trials
#' @param verbose logical, should the function provide detailed output on validation results?
#'   Default: `TRUE`
#'
#' @return An object of class 'hrqolr_scenario' with validated inputs.
#' @export
#'
setup_scenario <- function(
		arms = NULL,
		n_patients_per_arm = NULL,
		index_hrqol = NULL,
		first_hrqol = NULL,
		final_hrqol = NULL,
		acceleration_hrqol = NULL,
		mortality = NULL,
		mortality_dampening = NULL,
		mortality_trajectory_shape = NULL,
		prop_mortality_benefitters = NULL,
		sampling_frequency = NULL,
		verbose = TRUE
) {

	args <- formals()
	called_args <- match.call()[-1]
	args[names(called_args)] <- called_args
	args["verbose"] <- NULL

	if (is.null(arms) || length(arms) < 2 || length(unique(args)) == 1) {
		stop0("The scenario must have at least 2 arms of different names")
	}

	arg_requirements <- list(
		n_patients_per_arm = list(fun = verify_int, min_value = 1),
		index_hrqol = list(fun = verify_num),
		first_hrqol = list(fun = verify_num),
		final_hrqol = list(fun = verify_num),
		acceleration_hrqol = list(fun = verify_num, min_value = -1),
		mortality = list(fun = verify_num, min_value = 0, max_value = 1),
		mortality_dampening = list(fun = verify_num, min_value = 0, max_value = 1),
		mortality_trajectory_shape = list(
			fun = verify_chr,
			valid_values = list("exp_decay", "reflected_exp_decay", "linear", "constant")
		),
		prop_mortality_benefitters = list(fun = verify_num, min_value = 0, max_value = 1),
		sampling_frequency = list(fun = verify_int, min_value = 1)
	)


	val_results <- list()

	for (arg_name in names(args)) {
		a <- eval(args[[arg_name]])
			# eval(a) needed to handle edge case when a == -1 and, then, is considered a call
		req <- arg_requirements[[arg_name]]

		val_results[[arg_name]] <- if (arg_name == "arms") {
			args[[arg_name]] <- setNames(a, a) # need to keep the evaluated version
			c(result = "valid as is", comment = "")
		} else if (is.null(a)) {
			c(result = "invalid", comment = "cannot be NULL")
		} else if (length(a)) {
			if (do.call(req$fun, c(list(a), req[-1]))) {
				args[[arg_name]] <- setNames(rep(a, length(arms)), arms)
				a_mod <- if (verify_chr(a)) sprintf("\"%s\"", a) else a # ensure correct printing to console
				c(
					result = "modified",
					comment = paste(a_mod, "-->", sprintf(
						"c(%s)", paste(sprintf("\"%s\"", arms), "=", a_mod, collapse = ", "))
					)
				)
			} else {
				c(result = "invalid", comment = "outside valid range or incorrect type")
			}
		} else {
			if (length(setdiff(names(a), arms)) > 0 & length(a) != length(arms)) {
				c(result = "invalid", comment = "the names do not match the names given in 'arms'")
			} else {
				if (!all(sapply(a, function(x) do.call(req$fun, c(list(x), req[-1]))))) {
					c(
						result = "invalid",
						comment = "at least one value outside valid range or of incorrect type"
					)
				} else {
					c(result = "valid as is", comment = "")
				}
			}
		}
	}
	attr(val_results, "class") <- "hrqolr_scenario_validation_results"

	if (isTRUE(verbose)) {
		print(val_results)
	}

	if (any(sapply(val_results, function(arg) arg["result"] == "invalid"))) {
		if (isFALSE(verbose)) {
			stop0("At least one argument was invalid. Try re-running with verbose = TRUE for details.")
		} else {
			stop0("At least one argument was invalid.")
		}
	}

	attr(args, "validation_results") <- val_results

	structure(args, class = c("hrqolr_scenario", "list"))
}