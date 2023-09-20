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

		n_digits = 3
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

	purrr::map_dfr(
		patient_traj,
		~ with(., c(hrqol_at_eoc = y[length(y)], hrqol_auc = auc(x, y, min_y = 0.0))),
		.id = "analysis"
	)
}
