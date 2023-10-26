test_that("simulate_trials S3 method works", {
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
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	sims_single_batch <- suppressMessages(simulate_trials(
		scenario,
		n_trials = 10,
		n_patients_ground_truth = 10,
		n_example_trajectories_per_arm = 10,
		verbose = TRUE,
		test_fun = welch_t_test,
		include_trial_results = TRUE,
		seed = 42
	))
	sims_single_batch$resource_use <- NULL # will change from run to run
	sims_single_batch$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_single_batch)

	sims_two_batches <- suppressMessages(simulate_trials(
		scenario,
		n_trials = 10,
		max_batch_size = 500,
		n_patients_ground_truth = 10,
		n_example_trajectories_per_arm = 10,
		verbose = FALSE,
		test_fun = welch_t_test,
		seed = 42
	))
	sims_two_batches$resource_use <- NULL # will change from run to run
	sims_two_batches$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_two_batches)
})
