test_that("Caching works", {
	expect_silent(cache_hrqolr(max_size = 1024))
	expect_silent(in_memory_cache(Inf))

	# Invalid argument
	expect_snapshot_error(in_memory_cache(NA))

	long_vector <- rep(1.0, 5e2)
	cache <- in_memory_cache(max_size = 10 * 1024)

	# Ascertain validity of the subsequent expectations
	expect_equal(
		as.numeric(object.size(long_vector)),
		4048
	)

	# Add elements that fit in the cache
	expect_true(fastmap::is.key_missing(cache$get("x")))
	cache$set("x", long_vector)
	cache$set("y", long_vector)
	expect_equal(sort(cache$keys()), sort(c("y", "x")))
	expect_snapshot(cache$info(), variant = "before_reset")
	expect_snapshot(cache$info(c("max_size", "total_size")), variant = "before_reset")
	expect_snapshot(cache$info(c("max_total_size")), variant = "before_reset")

	# Exceed cache size and confirm correct behaviour
	cache$set("z", long_vector)
	expect_equal(cache$keys(), "z")
	expect_snapshot(cache$info(), variant = "after_reset")

	# Try to re-assign new value to existing key
	cache$set("z", rep(1.0, 1e2))


})
