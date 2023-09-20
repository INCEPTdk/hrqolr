#' Title
#'
#' @param t_icu_discharge
#' @param sampling_frequency
#' @param acceleration_hrqol
#' @param start_hrqol_arm
#' @param start_hrqol_patient
#' @param final_hrqol_arm
#' @param t_death
#' @param is_mortality_benefitter
#' @param mortality_trajectory
#' @param mortality_dampening
#' @param n_digits
#'
#' @keywords internal
#' @return
#'
compute_estimates <- function(
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

		n_digits = 2
) {
	patient_trajs <- construct_patient_trajectory(
		t_icu_discharge = t_icu_discharge,
		sampling_frequency = sampling_frequency,
		acceleration_hrqol = acceleration_hrqol,
		start_hrqol_arm = start_hrqol_arm,
		start_hrqol_patient = start_hrqol_patient,
		final_hrqol_arm = final_hrqol_arm,

		t_death = t_death,
		is_mortality_benefitter = is_mortality_benefitter,
		mortality_trajectory = mortality_trajectory,
		mortality_dampening = mortality_dampening,

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
