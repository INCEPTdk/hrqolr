#' Simulate single trial from scenario
#'
#' This is the key user-facing function for simulating trials.
#'
#' @param ... passed on to methods
#'
#' @return An object of class `hrqolr_trial`, which is a specialised list.
#'
#' @name simulate_trial
#'
#' @export
#' @import data.table
#'
simulate_trial <- function(scenario, ...) {
	UseMethod("simulate_trial")
}


#' Helper for when scenario given as first argument
#'
#' @inheritParams simulate_trials
#'
#' @rdname simulate_trial
#' @export
#'
simulate_trial.hrqolr_scenario <- function(
		scenario,
		n_patients_ground_truth = 1000,
		test_fun = welch_t_test,
		n_digits = 2,
		valid_hrqol_range = c(-0.757, 1.0),
		alpha = 0.05,
		seed = NULL,
		...
) {

	called_args <- as.list(match.call())[-1]
	default_args <- formals()
	default_args <- default_args[setdiff(names(default_args), names(called_args))]
	default_args["..."] <- NULL

	args <- c(
		lapply(called_args, eval, parent.frame()),
		lapply(default_args, eval, envir = environment())
	)

	if (!is.null(utils::packageName(environment(test_fun)))) {
		attr(args$test_fun, "fun_name") <- deparse(substitute(test_fun))
	}

	args <- c(scenario, args) # flatten args in scenario object

	do.call("simulate_trial.default", args)
}


#' Internal default workhorse function for simulate_trial
#'
#' Internal function that shouldn't really be invoked by the user directly. The arguments given must
#' be named vectors.
#'
#' @inheritParams setup_scenario
#' @param ... not used
#'
#' @keywords internal
#' @import data.table
#'
simulate_trial.default <- function(
		arms,
		n_patients,
		sampling_frequency,

		index_hrqol,
		first_hrqol,
		final_hrqol,
		acceleration_hrqol,

		mortality,
		mortality_dampening,
		mortality_trajectory_shape,
		prop_mortality_benefitters,

		test_fun,
		verbose = FALSE,
		n_digits,
		valid_hrqol_range,
		alpha,
		seed = NULL,
		...
) {

	# Handling seeds ====
	try({ # will fail e.g. if called from parallel::parLapply
		old_seed <- get(".Random.seed", envir = globalenv(), inherits = FALSE)
		on.exit(
			assign(".Random.seed", value = old_seed, envir = globalenv(), inherits = FALSE),
			add = TRUE,
			after = FALSE
		)
	}, silent = TRUE)
	RNGkind("Mersenne-Twister")
	set.seed(seed)

	# Sample results from patient trajectories
	mortality_funs <- sapply(mortality, generate_mortality_funs, simplify = FALSE)

	patient_results <- setNames(vector("list", length(arms)), arms)

	for (arm in arms) {
		inter_patient_noise_sd <- first_hrqol[arm] / 1.96

		patient_results[[arm]] <- estimation_helper(
			n_patients = n_patients[arm],
			arm = arm,

			index_hrqol_arm = index_hrqol[arm],
			first_hrqol_arm = first_hrqol[arm],
			final_hrqol_arm = final_hrqol[arm],
			inter_patient_noise_sd = inter_patient_noise_sd,
			acceleration_hrqol = acceleration_hrqol[arm],

			prop_mortality_benefitters = prop_mortality_benefitters[arm],
			mortality_trajectory_shape = mortality_trajectory_shape[arm],
			mortality_dampening = mortality_dampening[arm],
			mortality_rng = mortality_funs[[arm]]$r,

			sampling_frequency = sampling_frequency[arm],
			n_digits = n_digits,
			valid_hrqol_range = valid_hrqol_range,
			verbose = verbose
		)
	}
	patient_results <- rbindlist(patient_results, idcol = "arm")
	patient_results[, patient_id := seq_len(.N)]
	setcolorder(patient_results, c("patient_id", "arm"))

	# Compute mean differences + corresponding p values and confidence intervals
	outcome_cols <- names(patient_results)[!names(patient_results) %in% c("patient_id", "arm")]
	mean_diffs <- mapply(
		function(col, analysis, na_replacement) {
			tmp <- patient_results[
				, test_fun(get(col), grps = arm, arms = arms, na_replacement = na_replacement)
			]
			tmp[, analysis := analysis]
			return(tmp)
		},
		col = rep(outcome_cols, each = 2),
		analysis = c("all", "survivors"), # repeated to match col parameter (the longest)
		na_replacement = list(0, NULL), # idem
		SIMPLIFY = FALSE
	)
	mean_diffs <- rbindlist(mean_diffs, idcol = "outcome")
	mean_diffs[, test_fun := attr(test_fun, "fun_name")]
	setcolorder(mean_diffs, c("outcome", "analysis"))

	# Build returned object
	structure(
		list(
			patient_results = copy(patient_results),
			mean_diffs = copy(mean_diffs),
			scenario = list(...)$scenario
		),
		class = c("hrqolr_trial", "list")
	)
}
