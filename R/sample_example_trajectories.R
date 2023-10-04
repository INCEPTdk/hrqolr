#' Sample example trajectories
#'
#' Sample a desired number of trajectories at arm leven and for individual patients.
#'
#' @inheritParams simulate_trials
#'
#' @export
#' @import data.table
#' @importFrom stats rnorm runif
#'
#' @return An object of class `hrqolr_examples` with trajectories in data.tables. The function will
#'   always return arm-level trajectories. If `n_example_trajectories_per_arm > 0`, it will also return
#'   data.table with patient trajectories, with a `id` column denoting patients. with
#'
sample_example_trajectories <- function(
		arms,
		n_example_trajectories_per_arm,
		first_hrqol,
		final_hrqol,
		sampling_frequency,
		acceleration_hrqol,

		mortality,
		prop_mortality_benefitters,
		mortality_trajectory_shape,
		mortality_dampening,

		n_digits = 2,
		seed = NULL,
		valid_hrqol_range,
		...
) {

	stopifnot(n_example_trajectories_per_arm > 0)

	out <- list(
		arm_level = list(),
		patient_level = list()
	)

	seed <- seed %||% digest::digest2int(paste(match.call(), collapse = ", "))
	set.seed(seed)

	browser()

	t_icu_discharge <- sample_t_icu_discharge(n_example_trajectories_per_arm)
	# the same for all arms to easy comparison ("counter-factual"-like)

	mortality_funs <- sapply(mortality, generate_mortality_funs, simplify = FALSE)

	for (arm in arms) {
		out$arm_level[[arm]] <- as.data.table(
			construct_arm_level_trajectory(
				t_icu_discharge = ceiling(stats::median(t_icu_discharge)),
				acceleration_hrqol = acceleration_hrqol[arm],
				first_hrqol_arm = first_hrqol[arm],
				final_hrqol_arm = final_hrqol[arm],
				sampling_frequency = sampling_frequency
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
						first_hrqol_arm = first_hrqol[arm],
						final_hrqol_arm = final_hrqol[arm],
						acceleration_hrqol = acceleration_hrqol[arm],
						mortality_trajectory_shape = mortality_trajectory_shape[arm],
						mortality_dampening = mortality_dampening[arm],
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
