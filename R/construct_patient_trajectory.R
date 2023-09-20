#' Title
#'
#' @inheritParams construct_arm_level_trajectory
#' @param acceleration_hrqol
#' @param start_hrqol_arm
#' @param start_hrqol_patient
#' @param final_hrqol
#' @param t_death
#' @param is_mortality_benefitter
#' @param mortality_trajectory
#' @param mortality_dampening
#' @param n_digits int, the number of digits of HRQoL values
#'
#' @return
#' @export
#'
construct_patient_trajectory <- function(
		t_icu_discharge = NULL,
		sampling_frequency = 14L,
		acceleration_hrqol = 0.0,
		start_hrqol_arm = 0.1,
		start_hrqol_patient = start_hrqol_arm,
		final_hrqol_arm = 0.75,

		t_death = Inf,
		is_mortality_benefitter = FALSE,
		mortality_trajectory = "exp_decay",
		mortality_dampening = 0.0,

		n_digits = 3
) {

	if (is.na(t_death)) {
		# Arm-level post-ICU discharge trajectory in survivors
		traj <- construct_arm_level_trajectory(
			t_icu_discharge = t_icu_discharge,
			sampling_frequency = sampling_frequency,
			acceleration_hrqol = acceleration_hrqol,
			start_hrqol = start_hrqol_arm,
			final_hrqol = final_hrqol_arm
		)

		# Enforce between-patient noise throughout trajectory
		y_new <- 1 - (1 - start_hrqol_patient) / (1 - start_hrqol_arm) * (1 - traj[, "y"])

		# Mortality-benefitter logic
		y_new <- y_new * (1 - mortality_dampening * is_mortality_benefitter)
		traj[, "y"] <- y_new
	} else if (isTRUE(t_death <= t_icu_discharge)) {
		traj <- na_matrix(t_icu_discharge)
	} else {
		traj <- construct_mortality_trajectory(
			t_death = t_death,
			t_icu_discharge = t_icu_discharge,
			start_hrqol = start_hrqol_patient * (1 - mortality_dampening * (start_hrqol_patient > 0)),
			shape = mortality_trajectory,
			resolution = 100
		)
	}

	traj[, "y"] <- round(traj[, "y"], n_digits)

	# Enforce sampling strategies and return
	construct_final_trajectories(traj, t_icu_discharge, sampling_frequency)
}
