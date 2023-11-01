test_that("Example trajectories are sampled correctly", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 50,
		index_hrqol = 0,
		first_hrqol = 0.2,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 0,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters = 0.0,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajs <- sample_example_trajectories(scenario, seed = 42)
	expect_snapshot(trajs)
})
