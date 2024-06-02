test_that("simulate_trials S3 method works", {
	cache_hrqolr() # needed to use caching also during tests

	# Resource use will change between runs, so this is a fixed yet equivalent list
	pseudo_resource_use <- list(
		elapsed_time = structure(0, class = "difftime", units = "secs"),
		peak_memory_use = structure(0, class = "hrqolr_bytes"),
		max_cache_size = structure(0, class = "hrqolr_bytes")
	)

	scenario1 <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 50,
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

	# Test simple things
	simple_sims <- simulate_trials(scenario1, verbose = FALSE)
	expect_s3_class(simple_sims, "hrqolr_results")

	expect_snapshot_error(simulate_trials(scenario1, n_trials = 0))

	# Ascertain that resource_use has the right elements
	expect_equal(
		names(pseudo_resource_use),
		names(simple_sims$resource_use)
	)

	sims_single_batch <- suppressMessages(simulate_trials(
		scenario1,
		n_trials = 100,
		n_patients_ground_truth = 10,
		n_example_trajectories_per_arm = 1000,
		verbose = TRUE,
		test_fun = welch_t_test,
		include_trial_results = TRUE,
		seed = 42
	))

	sims_single_batch$resource_use <- pseudo_resource_use
	sims_single_batch$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_single_batch)

	sims_two_batches_verbose <- suppressMessages(simulate_trials(
		scenario1,
		n_trials = 500,
		max_batch_size = 500,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 10,
		verbose = TRUE,
		test_fun = welch_t_test,
		seed = 42
	))
	sims_two_batches_verbose$resource_use <- pseudo_resource_use
	sims_two_batches_verbose$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_two_batches_verbose)

	sims_single_batch_without_examples <- suppressMessages(simulate_trials(
		scenario1,
		n_trials = 100,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 0,
		verbose = TRUE,
		test_fun = welch_t_test,
		include_trial_results = TRUE,
		seed = 42
	))
	sims_single_batch_without_examples$resource_use <- pseudo_resource_use
	sims_single_batch_without_examples$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_single_batch_without_examples)

	scenario2 <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 50,
		index_hrqol = 0,
		first_hrqol = 0.2,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters = 0.0,
		sampling_frequency = 14,
		verbose = FALSE
	)

	sims_single_batch_no_mort_benefitters <- suppressMessages(simulate_trials(
		scenario2,
		n_trials = 100,
		n_patients_ground_truth = 1000,
		n_example_trajectories_per_arm = 10,
		verbose = TRUE,
		test_fun = welch_t_test,
		include_trial_results = TRUE,
		seed = 42
	))
	sims_single_batch_no_mort_benefitters$resource_use <- pseudo_resource_use
	sims_single_batch_no_mort_benefitters$args$test_fun <- "welch_t_test"
	expect_snapshot(sims_single_batch_no_mort_benefitters)
})
