#' Compute outcome estimates for a given patient
#'
#' @inheritParams construct_patient_trajectory
#' @inheritParams construct_final_trajectories
#'
#' @keywords internal
#' @return A six-element named numeric vector with single-sampled HRQoL at end of follow-up and area
#'   under the HRQoL trajectory for the primary and the two secondary analyses.
#'
compute_estimates <- function(
		# Specific to this patient
		t_icu_discharge = NULL,
		t_death = NA,
		start_hrqol_patient = start_hrqol_arm,
		is_mortality_benefitter = FALSE,

		# Scenario settings
		acceleration_hrqol = 0.0,
		start_hrqol_arm = 0.1,
		final_hrqol_arm = 0.75,
		mortality_trajectory_shape = "exp_decay",
		mortality_dampening = 0.0,

		# Constant across patients
		sampling_frequency = 14L,
		n_digits = 2
) {
	patient_trajs <- construct_patient_trajectory(
		t_icu_discharge = t_icu_discharge,
		t_death = t_death,
		start_hrqol_patient = start_hrqol_patient,

		acceleration_hrqol = acceleration_hrqol,
		start_hrqol_arm = start_hrqol_arm,
		final_hrqol_arm = final_hrqol_arm,
		is_mortality_benefitter = is_mortality_benefitter,
		mortality_trajectory_shape = mortality_trajectory_shape,
		mortality_dampening = mortality_dampening,

		sampling_frequency = sampling_frequency,
		n_digits = n_digits
	)

	res <- numeric(6)
	names(res) <- paste(
		rep(names(patient_trajs), each = 2),
		rep(c("hrqol_at_eof", "hrqol_auc"), 3),
		sep = "__"
	)

	for (i in seq_along(patient_trajs)) {
		this_traj <- patient_trajs[[i]]
		res[2 * i - 1] <- this_traj[nrow(this_traj), "y"]
		res[2 * i] <- auc(this_traj[, "x"], this_traj[, "y"])
	}

	return(res)
}
