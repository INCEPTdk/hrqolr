compute_estimates <- function(
		sampling_frequency = 14L,
		acceleration_hrqol = 0.0,
		start_hrqol_arm = 0.1,
		start_hrqol_patient = start_hrqol_arm,
		final_hrqol_arm = 0.75,

		t_death = Inf,
		is_mortality_benefitter = FALSE,
		mortality_trajectory = "exp_decay",
		mortality_dampening = 0.0
) {
	patient_traj <- construct_patient_trajectory(
		sampling_frequency = sampling_frequency,
		acceleration_hrqol = start_hrqol_arm,
		start_hrqol_arm = start_hrqol_arm,
		start_hrqol_patient = start_hrqol_patient,
		final_hrqol_arm = final_hrqol_arm,

		t_death = t_death,
		is_mortality_benefitter = is_mortality_benefitter,
		mortality_trajectory = mortality_trajectory,
		mortality_dampening = mortality_dampening
	)

	purrr::map_dfr(
		patient_traj,
		~ with(., c(hrqol_at_eoc = y[length(y)], hrqol_auc = auc(x, y, min_y = 0.0))),
		.id = "analysis"
	)
}
