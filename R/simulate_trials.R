#' Simulate trials
#'
#' This is the key user-facing function for simulating trials.
#'
#' @return An object of class `hrqolr_results`, which is a specialised list with four elements:
#'   summary statistics for each arm, comparisons (incl. performance metrics), the seed and the
#'   elapsed time.
#'
#' @name simulate_trials
#'
#' @export
#' @import data.table
#' @importFrom stats setNames
#'
simulate_trials <- function(...) {
	UseMethod("simulate_trials")
}


#' Helper for when scenario given as first argument
#'
#' @param scenario object of class 'hrqolr_scenario', the output of [setup_scenario]
#'
#' @rdname simulate_trials
#' @export
#'
simulate_trials.hrqolr_scenario <- function(
		scenario,
		n_trials = 100,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 50,
		test_fun = welch_t_test,
		sparse = TRUE,
		verbose = TRUE,
		n_digits = 2,
		seed = NULL,
		valid_hrqol_range = c(-0.757, 1.0),
		alpha = 0.05,
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
	args <- c(scenario, args) # flatten args in scenario object
	do.call("simulate_trials.default", args)
}


#' Work-horse
#'
#' @param arms character vector with the names of the arms. Must match the names of named vectors
#'   below.
#' @param n_patients_per_arm named int vector, number of patient in each arm
#' @param sampling_frequency named int vector, span between HRQoL sampling from patients, in each arm.
#'
#' @param index_hrqol named numeric vector, the HRQoL at index (= enrolment)
#' @param first_hrqol named numeric vector, the HRQoL at ICU discharge in each arm
#' @param final_hrqol named numeric vector, the HRQoL at end of follow-up in each arm
#' @param acceleration_hrqol named numeric vector, relative acceleration of HRQoL improvement in
#'   each arm
#'
#' @param mortality named numeric vector in `[0, 1]`, the mortality in at end of follow-up, in each
#'   arm
#' @param mortality_dampening named numeric vector, dampening effect on HRQoL at ICU discharge in
#'   patients who die before end of follow-up
#' @param mortality_trajectory_shape named character vector, valid values are: `"exp_decay"`
#'   (default), `"linear"`, `"constant"`, `"reflected_exp_decay"`. Can differ across arms.
#' @param prop_mortality_benefitters named numeric vector `[0, 1]`, the proportion of patients in
#'   each arm who are so-called mortality benefitters.
#'
#' @param n_trials int scalar or vector. If vector, simulations will be run in batches of size given
#' @param n_patients_ground_truth int, how many patients (per arm) to use when estimating the ground
#'   truth
#' @param n_example_trajectories_per_arm int, the number of example trajectories to include in the
#'   returned object
#'
#' @param test_fun function used to compare estimates. The default is `welch_t_test` (built into
#'   `hrqolr`). Note that the function should handle the number of arms provided. See **Details**
#'   below.
#' @param verbose logical, should the function give progress timestamped updates? Default: `TRUE`
#' @param seed int, optional seed for reproducible pseudo-random number generation. Defaults to a
#'   deterministic value based on the arguments given (ensuring reproducibility by default).
#' @param n_digits int, the number of digits of HRQoL values. More digits will yield greater
#'   precision but also cause longer run-times.
#' @param valid_hrqol_range two-element numeric vector, the lower and upper bounds of valid HRQoL
#'   values. The default (`c(-0.757, 1.0)`) corresponds to the Danish EQ-5D-5L index values.
#' @param alpha scalar in `[0, 1]`, the desired type 1 error rate used when comparing HRQoL in the
#'   arms.
#' @param sparse logical, indicates whether trial-level results are kept. Default is `FALSE` because
#'   the resulting object may be very large if many trials are simulated.
#' @param ... not used
#'
#' @details
#' * `test_fun`: \[pending\]
#' @rdname simulate_trials
#' @export
#'
simulate_trials.default <- function(
		arms,
		n_patients_per_arm,
		sampling_frequency,

		index_hrqol,
		first_hrqol,
		final_hrqol,
		acceleration_hrqol,

		mortality,
		mortality_dampening,
		mortality_trajectory_shape,
		prop_mortality_benefitters,

		n_trials = 100,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 50,

		sparse = TRUE,
		test_fun = welch_t_test,
		verbose = TRUE,
		n_digits = 2,
		seed = NULL,
		valid_hrqol_range = c(-0.757, 1.0),
		alpha = 0.05,
		...
) {

	start_time <- Sys.time()
	peak_memory_use <- NULL


	# Setup ====
	seed <- seed %||% digest::digest2int(paste(match.call(), collapse = ", "))
		# If no seed provided, one is created in a deterministic (yet, uncorrelated) way
	set.seed(seed)

	mortality_funs <- sapply(mortality, generate_mortality_funs, simplify = FALSE)

	n_patients_per_batch <- lapply(n_trials, function(n) n * n_patients_per_arm)
	trial_ids_by_batch <- split(
		seq_len(sum(n_trials)),
		rep(seq_along(n_trials), n_trials)
	)

	ground_truth <- list()

	results <- list(
		summary_stats = list(),
		mean_diffs = list()
	)

	trial_results <- list()

	for (batch_idx in seq_along(n_patients_per_batch)) {
		if (isTRUE(verbose) & length(n_patients_per_batch) > 1) {
			log_timediff(start_time, paste("STARTING BATCH", batch_idx))
		}

		batch_res <- list()

		# Estimation for arm in batch ====
		for (arm in arms) {
			start_time_arm_in_batch <- Sys.time()

			n_patients <- n_patients_per_batch[[batch_idx]][arm]

			inter_patient_noise_sd <- first_hrqol[arm] / 1.96

			# Ground-truth estimation ====
			if (batch_idx == 1) {
				if (isTRUE(verbose)) log_timediff(start_time, paste("Estimating ground truth of arm", arm))

				# Use different seed for ground-truth sampling as this must be entirely independent
				current_seed <- .Random.seed
				set.seed(digest::digest2int(paste(c(match.call(), arm), collapse = ", ")))

				gt_res <- estimation_helper(
					n_patients = n_patients_ground_truth,
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
					valid_hrqol_range = valid_hrqol_range
				)

				outcome_cols <- names(gt_res)[!names(gt_res) %in% c("trial_id", "arm")]

				tmp <- sapply(
					outcome_cols,
					function(col) {
						gt_res[, list(ground_truth = fast_mean(replace_na(get(col), 0)))]
					},
					simplify = FALSE
				)

				ground_truth[[arm]] <- rbindlist(tmp, idcol = "outcome")
				peak_memory_use <- measure_memory_use(peak_memory_use)

				rm(gt_res)
				peak_memory_use <- measure_memory_use(peak_memory_use)
				.Random.seed <- current_seed
			}

			res <- estimation_helper(
				n_patients = n_patients,
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
				valid_hrqol_range = valid_hrqol_range
			)
			peak_memory_use <- measure_memory_use(peak_memory_use)

			# Assign trial IDs
			res[, trial_id := sample(rep(trial_ids_by_batch[[batch_idx]], n_patients_per_arm[arm]))]

			batch_res[[arm]] <- res

			if (isTRUE(verbose)) log_timediff(start_time_arm_in_batch, sprintf("Finished arm '%s' in batch", arm))

			peak_memory_use <- measure_memory_use(peak_memory_use)
		}

		batch_res <- rbindlist(batch_res, idcol = "arm")
		peak_memory_use <- measure_memory_use(peak_memory_use)

		# Arm-level summary statistics ====
		tmp <- sapply(
			outcome_cols,
			function(col) {
				batch_res[, .(
					all = fast_mean(replace_na(get(col), 0)),
					survivors = fast_mean(get(col)[!is.na(get(col))])
				), by = c("trial_id", "arm")]
			},
			simplify = FALSE
		)
		peak_memory_use <- measure_memory_use(peak_memory_use)

		results$summary_stats[[batch_idx]] <- rbindlist(tmp, idcol = "outcome")
		peak_memory_use <- measure_memory_use(peak_memory_use)

		# Trial-level effect estimates
		tmp <- mapply(
			function(col, label, na_replacement) {
				tmp <- batch_res[
					, test_fun(get(col), grps = arm, arms = arms, na_replacement = na_replacement),
					by = "trial_id"
				]
				tmp[, analysis := label]
				return(tmp)
			},
			col = rep(outcome_cols, each = 2),
			label = c("all", "survivors"), # repeated to match col parameter (the longest)
			na_replacement = list(0, NULL), # idem
			SIMPLIFY = FALSE
		)

		results$mean_diffs[[batch_idx]] <- data.table::rbindlist(tmp, idcol = "outcome")
		peak_memory_use <- measure_memory_use(peak_memory_use)

		# Keep trial-level results if so desired
		if (isFALSE(sparse)) {
			trial_results[[batch_idx]] <- batch_res
		}
		peak_memory_use <- measure_memory_use(peak_memory_use)

		# Housekeeping
		rm(tmp, batch_res)
		peak_memory_use <- measure_memory_use(peak_memory_use)

		if (isTRUE(verbose)) log_timediff(start_time_arm_in_batch, "Finished batch")
	}

	clear_hrqolr_cache()
	peak_memory_use <- measure_memory_use(peak_memory_use)

	if (isTRUE(verbose)) log_timediff(start_time, "Combining data into final return struct")
	results <- lapply(results, rbindlist)

	# Combine ground truth value into a single data.table ====
	ground_truth <- rbindlist(ground_truth, idcol = "arm")
	data.table::setkey(ground_truth, "arm") # needed for subsetting by arm name directly
	peak_memory_use <- measure_memory_use(peak_memory_use)

	ground_truth <- data.table::rbindlist(lapply(
		utils::combn(arms, m = 2, simplify = FALSE),
		function(arms) {
			tmp <- dcast(
				melt(ground_truth[arms], id.vars = c("arm", "outcome"), variable.name = "analysis"),
				outcome + analysis ~ arm
			)
			tmp[, .(
				outcome,
				comparator = arms[1],
				target = arms[2],
				mean_ground_truth = get(arms[2]) - get(arms[1])
			)]
		}
	))
	peak_memory_use <- measure_memory_use(peak_memory_use)

	# Arm-level summary stats across trials ====
	summary_stats <- melt(
		results$summary_stats,
		id.vars = c("outcome", "arm", "trial_id"),
		variable.name = "analysis")
	summary_stats <- summary_stats[, summarise_var(value), by = c("outcome", "arm", "analysis")]
	class(summary_stats) <- c("hrqolr_summary_stats", class(summary_stats))
	peak_memory_use <- measure_memory_use(peak_memory_use)

	# Comparisons across trials ====
	comparisons <- merge(results$mean_diffs, ground_truth)

	by_cols <- c("outcome", "analysis", "comparator", "target")
	comparisons <- merge(
		comparisons[
			, compute_performance_metrics(est, mean_ground_truth, p_value, ci_lo, ci_hi, alpha), by = by_cols
		],
		comparisons[
			, c(list(n_sim = .N), summarise_var(est)), by = by_cols
		]
	)

	comparisons <- merge(comparisons, ground_truth, by = c("outcome", "comparator", "target")) # add column with ground truth mean diff
	setnames(comparisons, "mean", "mean_estimate")
	setcolorder(
		comparisons,
		c("outcome", "comparator", "target", "mean_estimate", "mean_ground_truth", "sd", "se")
	)

	class(comparisons) <- c("hrqolr_comparisons", class(comparisons))
	peak_memory_use <- measure_memory_use(peak_memory_use)

	# Trial-level results if so desired ====
	if (isFALSE(sparse)) {
		trial_results <- rbindlist(trial_results)
	}

	# Example trajectories ====
	example_trajectories <- if (n_example_trajectories_per_arm > 0) {
		if (isTRUE(verbose)) log_timediff(start_time, "Sampling example trajectories")
		do.call(sample_example_trajectories, args)
	} else {
		list(NULL)
	}
	peak_memory_use <- measure_memory_use(peak_memory_use)

	# Prepare arguments for inclusion in function output ====
	called_args <- as.list(match.call())[-1]
	default_args <- formals()
	default_args <- default_args[setdiff(names(default_args), names(called_args))]
	default_args["..."] <- NULL

	args <- c(
		lapply(called_args, eval, parent.frame()),
		lapply(default_args, eval, envir = environment())
	)
	args$seed <- seed

	if (isTRUE(verbose)) log_timediff(start_time, "Wrapping up, returning output")
	structure(
		list(
			summary_stats = summary_stats,
			comparisons = comparisons,
			args = args,
			trial_results = if (isTRUE(sparse)) list(NULL) else trial_results,
			example_trajectories = example_trajectories,
			resource_use = list(
				elapsed_time = Sys.time() - start_time,
				peak_memory_use = peak_memory_use %||% NA_real_
			)
		),
		class = c("hrqolr_results", "list")
	)
}
