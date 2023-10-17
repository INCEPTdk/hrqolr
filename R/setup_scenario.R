#' Helper for setting up valid scenarios
#'
#' Inputs are validated to ensure they produce the expected results when given as the input in
#' [simulate_trials]. Therefore, any arguments to this function can also be just a single value
#' (except the `arms` argument), and this function will expand such single-valued arguments to be
#' compatible with `simulate_trials`. If arguments are named vectors, they must have exactly one
#' value per arm, and the names must match those given in the `arms`.
#'
#' @param arms character vector with the names of the arms
#' @param n_patients named int (scalar or named vector), number of patients
#' @param sampling_frequency int (scalar or named vector), span between HRQoL sampling from patients
#'
#' @param index_hrqol numeric (scalar or named vector), the HRQoL at index (= enrolment)
#' @param first_hrqol numeric (scalar or named vector), the HRQoL at ICU discharge in each arm
#' @param final_hrqol numeric (scalar or named vector), the HRQoL at end of follow-up in each arm
#' @param acceleration_hrqol numeric (scalar or named vector), relative acceleration of HRQoL
#'   improvement in each arm
#'
#' @param mortality numeric (scalar or named vector) in \[0, 1\], the mortality in at end of
#'   follow-up, in each arm
#' @param mortality_dampening numeric (scalar or named vector), dampening effect on HRQoL at ICU
#'   discharge in patients who die before end of follow-up
#' @param mortality_trajectory_shape character (scalar or named vector), valid values are
#'   `"exp_decay"` (default), `"linear"`, `"constant"`, `"reflected_exp_decay"` and can differ
#'   across arms.
#' @param prop_mortality_benefitters numeric (scalar or named vector) `[0, 1]`, the proportion of
#'   patients in each arm who are so-called mortality benefitters.
#' @param verbose logical, should the function provide detailed output on validation results?
#'   Default: `TRUE`
#'
#' @return An object of class 'hrqolr_scenario' with validated inputs.
#' @export
#'
setup_scenario <- function(
		arms = NULL,
		n_patients = NULL,
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

	called_args <- as.list(match.call())[-1]
	default_args <- formals()
	default_args <- default_args[setdiff(names(default_args), names(called_args))]

	args <- c(
		lapply(called_args, eval, parent.frame()),
		lapply(default_args, eval, envir = environment())
	)
	args["verbose"] <- NULL

	if (is.null(arms) || length(unique(arms)) < 2) {
		stop0("The scenario must have at least 2 arms of different names")
	}

	arg_requirements <- list(
		n_patients = list(fun = verify_int, min_value = 1),
		index_hrqol = list(fun = verify_num),
		first_hrqol = list(fun = verify_num),
		final_hrqol = list(fun = verify_num),
		acceleration_hrqol = list(fun = verify_num, min_value = 0),
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
		a <- args[[arg_name]]
		req <- arg_requirements[[arg_name]]

		val_results[[arg_name]] <- if (arg_name == "arms") {
			args[[arg_name]] <- setNames(a, a)
			c(result = "valid as is", comment = "")
		} else if (is.null(a)) {
			c(result = "invalid", comment = "cannot be NULL")
		} else if (length(a) == 1) {
			if (do.call(req$fun, c(list(a), req[-1]))) {
				args[[arg_name]] <- setNames(rep(a, length(arms)), arms)
				c(result = "modified", comment = paste(deparse(a), "-->", deparse(args[[arg_name]])))
			} else {
				c(result = "invalid", comment = "outside valid range or incorrect type")
			}
		} else {
			if (length(setdiff(arms, names(a))) > 0 | length(a) != length(arms)) {
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
