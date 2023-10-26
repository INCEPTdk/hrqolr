test_that("Setup scenario handles single-value arguments", {
	expect_snapshot(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Active"), # test target
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active"), # test target
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = c(Active = 500, Ctrl = 1000), # test target
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = NULL, # test target
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = -1, # test target
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 2, # test target
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0.1,
			final_hrqol = c(0.4, 0.5), # test target
			acceleration_hrqol = 1,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0.1,
			final_hrqol = c(Active = 0.5, Control = 0.5),
			acceleration_hrqol = 1,
			mortality = c(Active = -0.1, Control = 0.5), # test target
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = FALSE
		)
	)

	expect_error(capture.output(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients = 500,
			index_hrqol = 0,
			first_hrqol = 0.1,
			final_hrqol = c(Active = 0.5, Control = 0.5),
			acceleration_hrqol = 1,
			mortality = c(Active = -0.1, Control = 0.5), # test target
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14,
			verbose = TRUE
		)
	))
})
