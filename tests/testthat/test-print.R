test_that("Printing of resource use works", {
	pseudo_resource_use <- list(
		elapsed_time = structure(0, class = "difftime", units = "secs"),
		peak_memory_use = structure(0, class = "hrqolr_bytes"),
		max_cache_size = structure(0, class = "hrqolr_bytes")
	)
	expect_snapshot(print(pseudo_resource_use))

	pseudo_resource_use_without_cache_size <- list(
		elapsed_time = structure(0, class = "difftime", units = "secs"),
		peak_memory_use = structure(0, class = "hrqolr_bytes"),
		max_cache_size = structure(NA, class = "hrqolr_bytes")
	)
	expect_snapshot(pseudo_resource_use_without_cache_size)
})

test_that("Printing hrqolr bytes works", {
	x <- structure(1.45e6, class = "hrqolr_bytes")
	expect_output(print(x), "1.45 MB")

	x <- structure(c(1000, 2000, 4000, 1e6), class = "hrqolr_bytes")
	expect_snapshot(x)
})
