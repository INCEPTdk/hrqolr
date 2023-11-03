#' Simulate trials
#'
#' This is the key user-facing function for simulating trials.
#'
#' @param ... passed on to methods
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
simulate_trials <- function(scenario, ...) {
	UseMethod("simulate_trials")
}


#' Helper for when scenario given as first argument
#'
#' @param scenario object of class 'hrqolr_scenario', the output of [setup_scenario]
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
#' @param n_digits int, the number of decimal places of in the first HRQoL values of patients.
#'   More digits will yield greater precision but also cause longer run-times.
#' @param valid_hrqol_range two-element numeric vector, the lower and upper bounds of valid HRQoL
#'   values. The default (`c(-0.757, 1.0)`) corresponds to the Danish EQ-5D-5L index values.
#' @param alpha scalar in `[0, 1]`, the desired type 1 error rate used when comparing HRQoL in the
#'   arms.
#' @param include_trial_results logical, indicates whether trial-level results are kept. Default is
#'   `FALSE` because the resulting object may be very large if many trials are simulated.
#' @param max_batch_size int, the maximum number of patients to process in each batch. The default
#'   is to use run one batch (i.e. no upper limit)
#'
#' @details
#' * `test_fun`: \[pending\]
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
		include_trial_results = FALSE,
		verbose = TRUE,
		n_digits = 2,
		valid_hrqol_range = c(-0.757, 1.0),
		alpha = 0.05,
		max_batch_size = NULL,
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
	do.call("simulate_trials.default", args)
}


#' Workhorse
#'
#' Internal function that shouldn't really be invoked by the user directly. The arguments given must
#' be named vectors.
#'
#' @inheritParams setup_scenario
#' @param ... not used
#'
#' @keywords internal
#'
simulate_trials.default <- function(
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

		n_trials = 100,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 50,

		include_trial_results,
		test_fun,
		verbose,
		n_digits,
		valid_hrqol_range,
		alpha,
		max_batch_size,
		seed = NULL,
		...
) {

	gc(reset = TRUE) # so gc() can be used to estimate peak memory use
	start_time <- Sys.time()

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

	# Setup ====
	mortality_funs <- sapply(mortality, generate_mortality_funs, simplify = FALSE)

	# Splitting trials into batches that respect the max_batch_size argument
	max_batch_size <- max_batch_size %||% sum(n_trials * n_patients)
	n_patients_total <- sum(n_trials * n_patients)
	n_trials_per_batch <- ceiling(n_trials / (n_patients_total / max_batch_size))
	n_batches <- ceiling(n_trials / n_trials_per_batch)

	trial_ids_by_batch <- split(
		seq_len(n_trials),
		rep(seq_len(n_batches), each = n_trials_per_batch)[1:n_trials]
	)

	n_patients_by_batch <- lapply(
		trial_ids_by_batch,
		function(trial_ids) length(trial_ids) * n_patients
	)

	# Output values
	ground_truth <- setNames(vector("list", length(arms)), arms)

	results <- list(
		summary_stats = vector("list", n_batches),
		mean_diffs = vector("list", n_batches)
	)

	trial_results <- if (isTRUE(include_trial_results)) {
		vector("list", n_batches)
	} else {
		list(NULL) # to have something to include in returned object
	}

	for (batch_idx in seq_len(n_batches)) {
		start_time_batch <- Sys.time()

		if (isTRUE(verbose) & n_batches > 1) {
			log_timediff(
				start_time,
				sprintf(
					"BATCH %s of %s - remaining: %s",
					batch_idx,
					n_batches,
					est_remaining_time(start_time, batch_idx, n_batches)
				),
				"cyan")
		}

		batch_res <- setNames(vector("list", length(arms)), arms)

		# Estimation for arm in batch ====
		for (arm in arms) {

			inter_patient_noise_sd <- first_hrqol[arm] / 1.96

			# Ground-truth estimation ====
			if (batch_idx == 1) {
				if (isTRUE(verbose)) {
					log_timediff(start_time_batch, sprintf("Estimating ground truth of arm '%s'", arm))
				}

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
					valid_hrqol_range = valid_hrqol_range,
					verbose = verbose
				)

				outcome_cols <- names(gt_res)[!names(gt_res) %in% c("trial_id", "arm")]
				tmp <- sapply(
					nafill(gt_res[, ..outcome_cols], "const", 0),
					function(col) .Call("C_Mean", col, PACKAGE = "hrqolr")
				)

				ground_truth[[arm]] <- data.table(
					outcome = outcome_cols,
					ground_truth = tmp
				)

				rm(gt_res, tmp)
				gc()
			}

			if (isTRUE(verbose)) log_timediff(start_time_batch, sprintf("Starting arm '%s'", arm))

			res <- estimation_helper(
				n_patients = n_patients_by_batch[[batch_idx]][arm],
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

			# Assign trial IDs
			res[, trial_id := sample(rep(trial_ids_by_batch[[batch_idx]], n_patients[arm]))]

			batch_res[[arm]] <- res
			rm(res)
			gc()
		}

		batch_res <- rbindlist(batch_res, idcol = "arm")

		# Arm-level summary statistics ====
		tmp <- sapply(
			outcome_cols,
			function(col) {
				batch_res[, .(
					all = .Call("C_Mean", replace_na(get(col), 0), PACKAGE = "hrqolr"),
					survivors = .Call("C_Mean", get(col)[!is.na(get(col))], PACKAGE = "hrqolr")
				), by = c("trial_id", "arm")]
			},
			simplify = FALSE
		)

		results$summary_stats[[batch_idx]] <- rbindlist(tmp, idcol = "outcome")
		rm(tmp)
		gc()

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

		results$mean_diffs[[batch_idx]] <- rbindlist(tmp, idcol = "outcome")
		rm(tmp)
		gc()

		# Keep trial-level results if so desired
		if (isTRUE(include_trial_results)) {
			trial_results[[batch_idx]] <- batch_res
		}

		# Housekeeping
		rm(batch_res)
		gc()

		if (isTRUE(verbose)) {
			log_timediff(start_time_batch, ifelse(n_batches > 1, "Finished batch", "Finished"))
		}
	}

	max_size_of_cache <- tryCatch(
		lobstr::obj_size(.hrqolr_cache_user),
		error = function(e) NA
	)
	clear_hrqolr_cache()
	gc()

 	results <- lapply(results, rbindlist)

	# Combine ground truth value into a single data.table ====
	ground_truth <- rbindlist(ground_truth, idcol = "arm")
	setkey(ground_truth, "arm") # needed for subsetting by arm name directly

	ground_truth <- rbindlist(lapply(
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

	# Arm-level summary stats across trials ====
	summary_stats <- melt(
		results$summary_stats,
		id.vars = c("outcome", "arm", "trial_id"),
		variable.name = "analysis"
	)
	summary_stats <- summary_stats[, summarise_var(value), by = c("outcome", "arm", "analysis")]
	class(summary_stats) <- c("hrqolr_summary_stats", class(summary_stats))

	results$summary_stats <- NULL
	gc()

	# Comparisons across trials ====
	comparisons <- merge(results$mean_diffs, ground_truth)
	results$comparisons <- NULL
	gc()

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

	# Trial-level results if so desired ====
	if (isTRUE(include_trial_results)) {
		trial_results <- rbindlist(trial_results)
	}

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

	# Example trajectories ====
	example_trajectories <- if (n_example_trajectories_per_arm > 0) {
		if (isTRUE(verbose)) log_timediff(start_time, "Sampling example trajectories")
		do.call(sample_example_trajectories.default, args)
	} else {
		list(NULL)
	}

	# Create output object ====
	if (isTRUE(verbose)) log_timediff(start_time, "Wrapping up, returning output")
	structure(
		list(
			summary_stats = summary_stats,
			comparisons = comparisons,
			args = args,
			trial_results = trial_results,
			example_trajectories = example_trajectories,
			resource_use = list(
				elapsed_time = Sys.time() - start_time,
				peak_memory_use = structure(
					sum(gc()[, "max used"] * c(node_size(), 8)),
					class = "hrqolr_bytes"
				),
				max_cache_sizes = list(
					user = max_size_of_cache,
					package = tryCatch(
						lobstr::obj_size(.hrqolr_cache_user),
						error = function(e) NA
					)
				)
			)
		),
		class = c("hrqolr_results", "list")
	)
}
