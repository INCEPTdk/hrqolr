test_that("Caching works", {
	expect_silent(cache_hrqolr(max_size = 1024))

	long_vector <- rep(1.0, 5e2)
	cache <- hrqolr:::in_memory_cache(max_size = 10 * 1024)

	# Ascertain validity of the subsequent expectations
	expect_equal(
		as.numeric(object.size(long_vector)),
		4048
	)

	expect_true(fastmap::is.key_missing(cache$get("x")))
	cache$set("x", long_vector)
	cache$set("y", long_vector)
	cache$set("z", long_vector)

	expect_equal(sort(cache$keys()), sort(c("z", "y", "x")))
	expect_snapshot(cache$info(), variant = "before_reset")

	cache$set("v", long_vector) # this exceed max_size, so cache is reset
	expect_equal(cache$keys(), "v")
	expect_snapshot(cache$info(), variant = "after_reset")
})
