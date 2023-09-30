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
		n_example_trajectories_per_arm = 100,

		start_hrqol_ctrl = 0.1,
		final_hrqol_ctrl = 0.75,
		relative_improvement_start_hrqol_actv = 0.0,
		relative_improvement_final_hrqol_actv = 0.0,
		sampling_frequency = 14L,
		acceleration_hrqol_actv = 0.1,

		mortality_ctrl = 0.4,
		relative_mortality_reduction_actv = 0.05,
		mortality_dampening = 0.7,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters_actv = 0.1,

		n_digits = 2,
		seed = NULL,
		...
) {

	stopifnot(n_example_trajectories_per_arm > 0)

	out <- list(
		arm_level = list(),
		patient_level = list()
	)

	seed <- seed %||% digest::digest2int(paste(match.call(), collapse = ", "))
	set.seed(seed)

	t_icu_discharge <- sample_t_icu_discharge(n_example_trajectories_per_arm)
	# the same for all arms to easy comparison ("counter-factual"-like)

	mortality_funs <- list(
		ctrl = generate_mortality_funs(mortality_ctrl),
		actv = generate_mortality_funs(mortality_ctrl * (1 - relative_mortality_reduction_actv))
	)

	for (arm in c("actv", "ctrl")) {
		acceleration_hrqol <- acceleration_hrqol_actv * (arm == "actv")

		relative_improvement_start_hrqol <- 1L + relative_improvement_start_hrqol_actv * (arm == "actv")
		start_hrqol_arm <- round(start_hrqol_ctrl * relative_improvement_start_hrqol, n_digits)

		relative_improvement_final_hrqol <- 1L + relative_improvement_final_hrqol_actv * (arm == "actv")
		final_hrqol_arm <- round(final_hrqol_ctrl * relative_improvement_final_hrqol, n_digits)

		out$arm_level[[arm]] <- as.data.table(
			construct_arm_level_trajectory(
				t_icu_discharge = ceiling(mean(t_icu_discharge)),
				acceleration_hrqol = acceleration_hrqol,
				start_hrqol_arm = start_hrqol_arm,
				final_hrqol_arm = final_hrqol_arm,
				sampling_frequency = sampling_frequency
			)
		)

		t_death <- mortality_funs[[arm]]$r(n_example_trajectories_per_arm)
		is_mortality_benefitter <- (arm == "actv") &
			(runif(n_example_trajectories_per_arm) < prop_mortality_benefitters_actv)
		inter_patient_noise_sd <- start_hrqol_ctrl * relative_improvement_start_hrqol / 1.96
		start_hrqol_patients <- round(
			rnorm(n_example_trajectories_per_arm, start_hrqol_arm, inter_patient_noise_sd),
			digits = n_digits
		)

		out$patient_level[[arm]] <- rbindlist(
			mapply(
				function(arg1, arg2, arg3, arg4) {
					traj <- construct_patient_trajectory(
						t_icu_discharge = arg1,
						start_hrqol_patient = arg2,
						t_death = arg3,
						is_mortality_benefitter = arg4,
						start_hrqol_arm = start_hrqol_arm,
						final_hrqol_arm = final_hrqol_arm,
						acceleration_hrqol = acceleration_hrqol,
						mortality_trajectory_shape = mortality_trajectory_shape,
						mortality_dampening = mortality_dampening,
						n_digits = n_digits
					)$primary
					as.data.table(traj)
				},
				t_icu_discharge,
				start_hrqol_patients,
				t_death,
				is_mortality_benefitter,
				SIMPLIFY = FALSE
			),
			idcol = "id"
		)
	}

	out <- lapply(out, rbindlist, idcol = "arm")

	out$arm_level[, arm := beautify_arm_var(arm)]
	out$patient_level[, `:=`(
		arm = beautify_arm_var(arm),
		id = cumsum(id != shift(id, n = 1, fill = 0, type = "lag")) # enforce unique ID's
	)]

	structure(out, class = c("hrqolr_trajectories", "list"))
}
