test_that("Setup scenario handles single-value arguments", {
	testthat::expect_snapshot(
		setup_scenario(
			arms = c("Active", "Control"),
			n_patients_per_arm = 500,
			index_hrqol = 0,
			first_hrqol = 0,
			final_hrqol = 0,
			acceleration_hrqol = 0,
			mortality = 0.2,
			mortality_dampening = 0,
			mortality_trajectory_shape = "exp_decay",
			prop_mortality_benefitters = 0.1,
			sampling_frequency = 14
		)
	)
})
