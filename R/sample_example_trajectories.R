#' Sample example trajectories
#'
#' Sample a desired number of trajectories at arm leven and for individual patients.
#'
#' @return An object of class `hrqolr_trajectories` with trajectories in data.tables. The function will
#'   always return arm-level trajectories. If `n_example_trajectories_per_arm > 0`, it will also return
#'   data.table with patient trajectories, with a `id` column denoting patients.
#'
#' @name sample_example_trajectories
#'
#' @export
#' @import data.table
#' @importFrom stats rnorm runif
#'
sample_example_trajectories <- function(scenario, ...) {
	UseMethod("sample_example_trajectories")
}


#' Helper for when scenario given as first argument
#'
#' @inheritParams simulate_trials.hrqolr_scenario
#' @rdname sample_example_trajectories
#' @export
#'
sample_example_trajectories.hrqolr_scenario <- function(
		scenario,
		n_example_trajectories_per_arm = 50,
		n_digits = 2,
		seed = NULL,
		valid_hrqol_range = c(-0.757, 1.0),
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

	do.call("sample_example_trajectories.default", args)
}


#' Workhorse
#'
#' Internal function that shouldn't really be invoked by the user directly. The arguments given must
#' be named vectors.
#'
#' @inheritParams simulate_trials
#' @rdname sample_example_trajectories
#' @keywords internal
#'
sample_example_trajectories.default <- function(
		arms,

		sampling_frequency,
		index_hrqol,
		first_hrqol,
		final_hrqol,
		acceleration_hrqol,

		mortality,
		prop_mortality_benefitters,
		mortality_trajectory_shape,
		mortality_dampening,

		n_example_trajectories_per_arm,
		n_digits,
		seed = NULL,
		valid_hrqol_range,
		...
) {

	try({ # will fail e.g. if called from parallel::parLapply
		old_seed <- get(".Random.seed", envir = globalenv(), inherits = FALSE)
		on.exit(
			assign(".Random.seed", value = old_seed, envir = globalenv(), inherits = FALSE),
			add = TRUE,
			after = FALSE
		)
	}, silent = TRUE)
	set.seed(seed)

	out <- list(
		arm_level = list(),
		patient_level = list()
	)

	t_icu_discharge <- sample_t_icu_discharge(n_example_trajectories_per_arm)
	# the same for all arms to easy comparison ("counter-factual"-like)

	mortality_funs <- sapply(mortality, generate_mortality_funs, simplify = FALSE)

	for (arm in arms) {
		out$arm_level[[arm]] <- as.data.table(
			construct_arm_level_trajectory(
				t_icu_discharge = ceiling(stats::median(t_icu_discharge)),
				acceleration_hrqol = acceleration_hrqol[arm],
				index_hrqol_arm = index_hrqol[arm],
				first_hrqol_arm = first_hrqol[arm],
				final_hrqol_arm = final_hrqol[arm],
				sampling_frequency = sampling_frequency[arm]
			)
		)

		t_death <- mortality_funs[[arm]]$r(n_example_trajectories_per_arm)

		is_mortality_benefitter <- if (prop_mortality_benefitters[arm] > 0) {
			stats::runif(n_example_trajectories_per_arm) < prop_mortality_benefitters[arm]
		} else {
			rep(FALSE, n_example_trajectories_per_arm)
		}

		inter_patient_noise_sd <- first_hrqol[arm] / 1.96

		first_hrqol_patients <- round(
			stats::rnorm(n_example_trajectories_per_arm, first_hrqol[arm], inter_patient_noise_sd),
			digits = n_digits
		)

		out$patient_level[[arm]] <- rbindlist(
			mapply(
				function(arg1, arg2, arg3, arg4) {
					traj <- construct_patient_trajectory(
						t_icu_discharge = arg1,
						first_hrqol_patient = arg2,
						t_death = arg3,
						is_mortality_benefitter = arg4,
						index_hrqol_arm = index_hrqol[arm],
						first_hrqol_arm = first_hrqol[arm],
						final_hrqol_arm = final_hrqol[arm],
						acceleration_hrqol = acceleration_hrqol[arm],
						mortality_trajectory_shape = mortality_trajectory_shape[arm],
						mortality_dampening = mortality_dampening[arm],
						sampling_frequency = sampling_frequency[arm],
						n_digits = n_digits
					)$primary
					as.data.table(traj)
				},
				t_icu_discharge,
				first_hrqol_patients,
				t_death,
				is_mortality_benefitter,
				SIMPLIFY = FALSE
			),
			idcol = "id"
		)
	}

	out <- lapply(out, rbindlist, idcol = "arm")

	out$patient_level[, id := cumsum(id != shift(id, n = 1, fill = 0, type = "lag"))]
		# enforce unique ID's

	structure(out, class = c("hrqolr_trajectories", "list"))
}
