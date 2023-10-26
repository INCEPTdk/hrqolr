#' By far most of this function already covered indirectly so this is just to
#' catch those few "edge cases" that aren't hit otherwise

test_that("Caching works", {
	clear_hrqolr_cache()

	traj <- as.matrix(data.frame(x = c(0, 5), y = c(0, NA)))
	print(hrqolr:::.hrqolr_cache_user$keys())
	final_trajs1 <- hrqolr:::construct_final_trajectories(
		traj, t_icu_discharge = 10, sampling_frequency = 14
	)
	print(hrqolr:::.hrqolr_cache_user$keys())

	final_trajs2 <- hrqolr:::construct_final_trajectories(
		traj, t_icu_discharge = 10, sampling_frequency = 14
	)
	print(hrqolr:::.hrqolr_cache_user$keys())

	expect_equal(final_trajs1, final_trajs2)
})
