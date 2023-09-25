#' Simulate trials
#'
#' This is the key user-facing function for simulating trials.
#'
#' @param n_patients_per_arm int scalar
#' @param n_trials int scalar or vector. If vector, simulations will be run in batches of size given
#'   by the elements.
#' @param start_hrqol_ctrl,final_hrqol_ctrl numeric scalars, the HRQoL at ICU discharge and end of
#'   follow-up in the control arm, respectively
#' @param relative_improvement_hrqol_actv scalar numeric, e.g. `0.10` means that the HRQoL at end of
#'   follow-up in the active arm will be increased by 10\% compared to the control arm
#' @param sampling_frequency int, for span between samplings from patients
#' @param acceleration_hrqol_actv scalar, relative acceleration of HRQoL improvement in the active
#'   arm
#' @param mortality_ctrl numeric scalar, the mortality in the control group at end of follow-up
#' @param relative_mortality_reduction_actv numeric scalar, e.g. `0.10` means that the mortality in
#'   the active arm is 90\% of that in the control arm
#' @param mortality_dampening scalar, dampening effect of HRQoL at ICU discharge in patients who die
#'   before end of follow-up
#' @param mortality_trajectory_shape string, should be any of the following four: `"exp_decay"`
#'   (default), `"linear"`, `"constant"`, `"reflected_exp_decay"`
#' @param prop_mortality_benefitters_actv scalar numeric in `[0, 1]`, the proportion of patients in
#'   the active arm who are so-called mortality benefitters.
#' @param seed int, optional seed for reproducible pseudo-random number generation. Defaults to a
#'   deterministic value based on the arguments given (ensuring reproducibility by default).
#' @param n_digits int, the number of digits of HRQoL values
#' @param n_patients_ground_truth int, how many patients (per arm) to use when estimating the ground
#'   truth
#'
#' @return An object of class `hrqolr_results`, which is a specialised list with four elements:
#'   summary statistics for each arm, comparisons (incl. performance metrics), the seed and the
#'   elapsed time.
#'
#' @export
#' @import data.table
#' @importFrom stats setNames
#'
simulate_trials <- function(
		n_trials = 100000L,
		n_patients_per_arm = 100L,

		start_hrqol_ctrl = 0.1,
		final_hrqol_ctrl = 0.75,
		relative_improvement_hrqol_actv = 0.1,
		sampling_frequency = 14L,
		acceleration_hrqol_actv = 0.1,

		mortality_ctrl = 0.4,
		relative_mortality_reduction_actv = 0.05,
		mortality_dampening = 0.7,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters_actv = 0.1,

		n_digits = 2,
		seed = NULL,
		n_patients_ground_truth = 100000L
) {

	start_time <- Sys.time()

	# If no seed provided, one is created in a deterministic (yet, uncorrelated) way
	seed <- seed %||% digest::digest2int(paste(match.call(), collapse = ", "))
	set.seed(seed)

	# Constants
	MIN_EQ5D5L_DK <- -0.757 # lowest possible EQ-5D-5L index value in Denmark
	ALPHA <- 0.05 # = 1.0 - significance level

	# Setup
	mortality_funs <- list(
		ctrl = generate_mortality_funs(mortality_ctrl),
		actv = generate_mortality_funs(mortality_ctrl * (1 - relative_mortality_reduction_actv))
	)

	n_patients_per_batch <- n_patients_per_arm * n_trials
	trial_ids_per_batch <- split(
		seq_len(sum(n_trials)),
		rep(seq_along(n_trials), n_trials)
	)

	results <- list(
		summary_stats = list(),
		mean_diffs = list()
	)

	ground_truth <- list()

	for (batch_idx in seq_along(n_patients_per_batch)) {
		log_timediff(start_time, paste("STARTING BATCH", batch_idx))
		n_patients <- n_patients_per_batch[[batch_idx]]

		batch_res <- list()

		for (arm in c("actv", "ctrl")) {
			start_time_arm_in_batch <- Sys.time()

			acceleration_hrqol <- acceleration_hrqol_actv * (arm == "actv")
			relative_improvement_hrqol <- 1L + relative_improvement_hrqol_actv * (arm == "actv")
			start_hrqol_arm <- round(start_hrqol_ctrl * relative_improvement_hrqol, n_digits)
			final_hrqol_arm <- round(final_hrqol_ctrl * relative_improvement_hrqol, n_digits)
			inter_patient_noise_sd <- start_hrqol_ctrl * relative_improvement_hrqol / 1.96

			if (batch_idx == 1) {
				log_timediff(start_time, paste("Estimating ground truth of arm", arm))

				old_seed <- .Random.seed
				set.seed(digest::digest2int(paste(c(match.call(), arm), collapse = ", ")))

				gt_res <- estimation_helper(
					n_patients = n_patients_ground_truth,
					arm = arm,
					prop_mortality_benefitters_actv = prop_mortality_benefitters_actv,
					start_hrqol_arm = start_hrqol_arm,
					inter_patient_noise_sd = inter_patient_noise_sd,
					acceleration_hrqol = acceleration_hrqol,
					mortality_trajectory_shape = mortality_trajectory_shape,
					mortality_dampening = mortality_dampening,
					mortality_rng = mortality_funs[[arm]]$r,
					n_digits = n_digits,
					min_valid_hrqol = MIN_EQ5D5L_DK
				)

				ground_truth[[arm]] <- gt_res[
					,
					c(
						setNames(lapply(.SD, function(col) mean(col, na.rm = TRUE)), paste0("surv__", names(.SD))),
						setNames(lapply(.SD, function(col) mean(replace_na(col, 0))), paste0("all__", names(.SD)))
					),
					.SDcols = names(gt_res)
				]

				rm(gt_res); gc()
				set.seed(old_seed)
			}

			res <- estimation_helper(
				n_patients = n_patients,
				arm = arm,
				prop_mortality_benefitters_actv = prop_mortality_benefitters_actv,
				start_hrqol_arm = start_hrqol_arm,
				inter_patient_noise_sd = inter_patient_noise_sd,
				acceleration_hrqol = acceleration_hrqol,
				mortality_trajectory_shape = mortality_trajectory_shape,
				mortality_dampening = mortality_dampening,
				mortality_rng = mortality_funs[[arm]]$r,
				n_digits = n_digits,
				min_valid_hrqol = MIN_EQ5D5L_DK
			)

			res[, trial_id := sample(rep(trial_ids_per_batch[[batch_idx]], n_patients_per_arm))]

			batch_res[[arm]] <- res

			log_timediff(start_time_arm_in_batch, sprintf("Finished %s arm in batch", arm))
		}

		batch_res <- data.table::rbindlist(batch_res, idcol = "arm")

		# Compute trial-level results
		cols <- paste0(
			rep(c("primary", "secondary1", "secondary2"), each = 2),
			c("__hrqol_at_eof", "__hrqol_auc")
		)

		# Arm-level summary statistics
		summary_stats <- batch_res[
			,
			c(
				setNames(lapply(.SD, function(col) mean(col, na.rm = TRUE)), paste0("surv__", cols, "__mean")),
				setNames(lapply(.SD, function(col) mean(replace_na(col, 0))), paste0("all__", cols, "__mean"))
			),
			.SDcols = cols, by = c("trial_id", "arm")
		]

		# Put into human-friendly format (essentially pivot data table)
		results$summary_stats[[batch_idx]] <- data.table::dcast(
			data.table::melt(
				summary_stats,
				id.vars = c("trial_id", "arm"),
				variable.name = "outcome"
			),
			trial_id + outcome ~ arm, value.var = "value"
		)

		# Trial-level effect estimates
		mean_diffs <- batch_res[
			,
			c(
				list(statistic = names(welch_t_test(1, 1))),
				setNames(lapply(.SD, welch_t_test, grps = arm), paste0("surv__", cols)),
				setNames(lapply(.SD, welch_t_test, grps = arm, na_replacement = 0), paste0("all__", cols))
			),
			.SDcols = cols, by = "trial_id"
		]

		# Put into human-friendly format (essentially pivot data table)
		results$mean_diffs[[batch_idx]] <- data.table::dcast(
			data.table::melt(
				mean_diffs,
				id.vars = c("trial_id", "statistic"),
				variable.name = "outcome"
			),
			trial_id + outcome ~ statistic, value.var = "value"
		)

		rm(summary_stats, mean_diffs, batch_res)
		gc()

		log_timediff(start_time_arm_in_batch, "Finished batch")
	}

	log_timediff(start_time, "Resetting large caches")
	memoise::forget(compute_estimates)
	memoise::forget(construct_arm_level_trajectory)
	memoise::forget(construct_final_trajectories)
	memoise::forget(construct_patient_trajectory)
	memoise::forget(generate_mortality_funs)

	log_timediff(start_time, "Combining data into final return struct")

	results <- lapply(results, data.table::rbindlist)

	# Combine ground truth value into a single data.table
	ground_truth <- data.table::rbindlist(ground_truth, idcol = "arm")
	ground_truth <- data.table::dcast(
		data.table::melt(ground_truth, id.vars = "arm", variable.name = "outcome"),
		outcome ~ arm, value.var = "value"
	)
	ground_truth[, `:=`(mean_diff = actv - ctrl, actv = NULL, ctrl = NULL)]

	# Summarise across trials
	summary_stats <- results$summary_stats[
		,
		.(statistic = names(summarise_var(1)), actv = summarise_var(actv), ctrl = summarise_var(ctrl)),
		by = "outcome"
	]
	summary_stats <- data.table::dcast(
		data.table::melt(summary_stats, id.vars = c("outcome", "statistic"), variable.name = "arm"),
		outcome + arm ~ statistic, value.var = "value"
	)

	comparisons <- merge(results$mean_diffs, ground_truth, by = "outcome")[
		,
		.(
			statistic = c(
				names(summarise_var(1)),
				"n_sim",
				names(compute_performance_metrics(1, 1, 1, 1, 1))
			),
			value = c(
				summarise_var(est),
				.N,
				compute_performance_metrics(est, mean_diff, p_value, ci_lo, ci_hi, alpha = ALPHA)
			)
		),
		by = "outcome"
	]

	comparisons <- merge(
		data.table::dcast(comparisons, outcome ~ statistic, value.var = "value"),
		ground_truth[, c("outcome", "mean_diff")],
		by = "outcome"
	)
	data.table::setnames(comparisons, "mean_diff", "mean_ground_truth")
	data.table::setcolorder(comparisons, c("outcome", "mean", "mean_ground_truth", "sd", "se"))

	# Prepare arguments for inclusion in function output
	args <- formals() # start with default values
	called_args <- as.list(match.call())[-1]
	args[names(called_args)] <- called_args
	args$seed <- seed

	log_timediff(start_time, "Wrapping out, returning output")

	structure(
		list(
			summary_stats = summary_stats,
			comparisons = comparisons,
			args = args,
			elapsed_time = Sys.time() - start_time
		),
		class = c("hrqolr_results", "list")
	)
}
