test_that("Caching works", {
	expect_silent(cache_hrqolr(max_size = 1024))
	expect_silent(cache_hrqolr(max_size = 1024, max_age = 60))
	expect_silent(cache_hrqolr(max_size = 1024, max_n = 100))
	expect_silent(cache_hrqolr(max_size = 1024, max_n = 100, evict = "fifo"))
})
