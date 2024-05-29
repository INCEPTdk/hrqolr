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
