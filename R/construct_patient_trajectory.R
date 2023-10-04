#' Construct the full (primary) HRQoL trajectory for a patient
#'
#' @inheritParams construct_arm_level_trajectory
#' @inheritParams construct_mortality_trajectory
#' @inheritParams simulate_trials
#' @param first_hrqol_patient scalar, the HRQoL value at ICU discharge of this patient
#' @param is_mortality_benefitter logical, is patient a mortality benefitters? Defaults to FALSE.
#'
#' @keywords internal
#' @inherit construct_final_trajectories return
#'
construct_patient_trajectory <- function(
		# Specific to this patient
		t_icu_discharge,
		t_death,
		first_hrqol_patient,

		# Scenario settings
		acceleration_hrqol,
		index_hrqol_arm,
		first_hrqol_arm,
		final_hrqol_arm,
		is_mortality_benefitter,
		mortality_trajectory_shape,
		mortality_dampening,

		# Constant across patients
		sampling_frequency = 14L,
		n_digits = 2
) {

	if (is.na(t_death)) {
		# Arm-level post-ICU discharge trajectory in survivors
		traj <- construct_arm_level_trajectory(
			t_icu_discharge = t_icu_discharge,
			sampling_frequency = sampling_frequency,
			acceleration_hrqol = acceleration_hrqol,
			index_hrqol_arm = index_hrqol_arm,
			first_hrqol_arm = first_hrqol_arm,
			final_hrqol_arm = final_hrqol_arm
		)

		# Enforce between-patient noise throughout trajectory
		y_new <- pmin(1, traj[-1, "y"] + (first_hrqol_patient - first_hrqol_arm * (1 + acceleration_hrqol)))

		# Mortality-benefitter logic
		y_new <- y_new * (1 - mortality_dampening * is_mortality_benefitter)

		traj[-1, "y"] <- y_new
	} else if (isTRUE(t_death <= t_icu_discharge)) {
		traj <- na_matrix(index_hrqol_arm, t_icu_discharge)
	} else {
		traj <- construct_mortality_trajectory(
			t_death = t_death,
			t_icu_discharge = t_icu_discharge,
			index_hrqol = index_hrqol_arm,
			first_hrqol = first_hrqol_patient * (1 - mortality_dampening * (first_hrqol_patient > 0)),
				# no dampening in patients who start with HRQoL <= 0
			mortality_trajectory_shape = mortality_trajectory_shape,
			resolution = 100
		)
	}

	traj[, "y"] <- round(traj[, "y"], n_digits)

	# Enforce sampling strategies and return
	construct_final_trajectories(traj, t_icu_discharge, sampling_frequency)
}
