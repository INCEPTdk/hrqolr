test_that("simulate_trial S3 method works", {
	cache_hrqolr() # needed to use caching also during tests

	# Resource use will change between runs, so this is a fixed yet equivalent list
	pseudo_resource_use <- list(
		elapsed_time = structure(0, class = "difftime", units = "secs"),
		peak_memory_use = structure(0, class = "hrqolr_bytes"),
		max_cache_size = structure(0, class = "hrqolr_bytes")
	)

	scenario_two_arms <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.2,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	# Test that things work without a seed
	trial_sim_without_seed <- simulate_trial(scenario_two_arms, verbose = FALSE)
	expect_s3_class(trial_sim_without_seed, "hrqolr_trial")

	# Test reproducible results using a seed, for two-arm trial
	trial_sim_two_arms <- suppressMessages(simulate_trial(
		scenario_two_arms,
		verbose = TRUE,
		test_fun = welch_t_test,
		seed = 42
	))

	expect_snapshot(trial_sim_two_arms)
	expect_true(all(trial_sim_two_arms$mean_diffs$test_fun == "welch_t_test"))

	# Test reproducible results using a seed, for three-arm trial
	scenario_three_arms <- setup_scenario(
		arms = c("Active1", "Active2", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.2,
		final_hrqol = c(Active1 = 0.7, Active2 = 0.6, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "linear",
		prop_mortality_benefitters = 0.0,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trial_sim_three_arms <- suppressMessages(simulate_trial(
		scenario_three_arms,
		verbose = TRUE,
		test_fun = games_howell_test,
		seed = 42
	))

	expect_snapshot(trial_sim_three_arms)
	expect_true(all(trial_sim_three_arms$mean_diffs$test_fun == "games_howell_test"))
})
