cache_hrqolr()

test_that("Trajetory plots with linear mortality shape", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "linear",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	p <- plot(trajectories)
	vdiffr::expect_doppelganger("trajectories__linear_shape", p)
})

test_that("Trajetory plots with exp. decay mortality shape", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "exp_decay",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	p <- plot(trajectories)
	vdiffr::expect_doppelganger("trajectories__exp_decay_shape", p)
})

test_that("Trajetory plots with constant mortality shape", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "constant",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	p <- plot(trajectories)
	vdiffr::expect_doppelganger("trajectories__constnat_shape", p)
})

test_that("Trajetory plots with reflect exp. decay mortality shape", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "reflected_exp_decay",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	p <- plot(trajectories)
	vdiffr::expect_doppelganger("trajectories__reflected_exp_decay_shape", p)
})

test_that("Summarised trajectory plot works", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "linear",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	# Default settings
	p <- plot(trajectories, which = "summarise")
	vdiffr::expect_doppelganger("summarised_trajs__default", p)

	# Other quantiles
	p <- plot(trajectories, which = "summarise", ribbon_percentiles = c(0.025, 0.975))
	vdiffr::expect_doppelganger("summarised_trajs__p2.5_p97.5", p)
})

test_that("Arm and patient trajectories are plotted correctly", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.5),
		acceleration_hrqol = 1,
		mortality = 0.2,
		mortality_dampening = 0,
		mortality_trajectory_shape = "linear",
		prop_mortality_benefitters = 0.1,
		sampling_frequency = 14,
		verbose = FALSE
	)

	trajectories <- sample_example_trajectories(
		scenario,
		n_example_trajectories_per_arm = 50,
		seed = 42,
		n_digits = 3
	)

	# Patient trajectories only
	p <- plot(trajectories, which = "patient")
	vdiffr::expect_doppelganger("patient_trajs_only__default", p)

	p <- plot(trajectories, which = "patient", patient_aes = list(linetype = 2))
	vdiffr::expect_doppelganger("patient_trajs_only__dashed_lines", p)

	# Arm-level trajectories only
	p <- plot(trajectories, which = "arm")
	vdiffr::expect_doppelganger("arm_trajs_only__default", p)

	p <- plot(trajectories, which = "arm", arm_aes = list(linetype = 2))
	vdiffr::expect_doppelganger("arm_trajs_only__dashed_lines1", p)

	p <- plot(trajectories, which = "arm", arm_aes = c(linetype = 2))
	vdiffr::expect_doppelganger("arm_trajs_only__dashed_lines2", p)
})

test_that("Single trials plot correctly", {
	scenario <- setup_scenario(
		arms = c("Active", "Control"),
		n_patients = 1000,
		index_hrqol = 0,
		first_hrqol = 0.3,
		final_hrqol = c(Active = 0.7, Control = 0.7),
		acceleration_hrqol = c(Active = 1.2, Control = 1),
		mortality = 0.0,
		mortality_dampening = 0,
		mortality_trajectory_shape = "linear",
		prop_mortality_benefitters = 0.0,
		sampling_frequency = 14,
		verbose = FALSE
	)

	single_trial <- simulate_trial(scenario, seed = 42)

	p <- plot(single_trial, ecdf = TRUE)
	vdiffr::expect_doppelganger("single_trial_ecdf", p)

	p <- plot(single_trial, ecdf = FALSE)
	vdiffr::expect_doppelganger("single_trial_epdf", p)
})
