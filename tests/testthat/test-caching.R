test_that("Caching works", {
	long_vector <- rep(1.0, 5e2)

	# Invalid arguments
	expect_snapshot_error(in_memory_cache(NA))
	expect_snapshot_error(in_memory_cache("none"))
	expect_snapshot_error(in_memory_cache(max_size = 1024, pruning_factor = 1.1))
	expect_snapshot_error(in_memory_cache(max_size = 1024, pruning_factor = -0.3))

	# Cache without size limit
	limitless_cache <- in_memory_cache(Inf)
	limitless_cache$set("x", long_vector)
	expect_equal("x", limitless_cache$keys())

	# Valid arguments
	expect_silent(cache_hrqolr(max_size = 1024))
	cache <- in_memory_cache(max_size = 10000, pruning_factor = 0.5)

	# Ascertain validity of the subsequent expectations
	expect_equal(
		as.numeric(object.size(long_vector)),
		4048
	)

	# Add elements that fit in the cache
	expect_true(fastmap::is.key_missing(cache$get("x")))
	cache$set("x", 1 * long_vector)
	cache$set("y", 2 * long_vector)
	expect_equal(sort(cache$keys()), c("x", "y"))
	expect_snapshot(cache$info(), variant = "before_pruning")
	expect_snapshot(cache$info(c("max_size", "total_size")), variant = "before_reset")
	expect_snapshot(cache$info(c("max_total_size")), variant = "before_reset")

	# Exceed cache size and confirm correct behaviour
	cache$set("z", 3 * long_vector)
	expect_equal(sort(cache$keys()), c("y", "z"))
	expect_snapshot(cache$info(), variant = "after_pruning")

	# Try to re-assign new value to existing key
	cache$set("z", 1)
	expect_equal(sort(cache$keys()), c("y", "z"))
	expect_snapshot(cache$get("z"), variant = "reassign_to_key")
	expect_snapshot(cache$info())
})
