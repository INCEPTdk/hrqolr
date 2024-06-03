test_that("generate_mortality_funs works", {
	funs <- hrqolr:::generate_mortality_funs(
		cum_mortality = 0.5,
		censoring_value = NA
	)

	expect_identical(round(funs$d(50), 8), 0.00100329)
	expect_identical(round(funs$d(c(10, 50)), 8), c(0.00803714, 0.00100329))

	expect_identical(round(funs$p(0.2), 8), 0.00275134)
	expect_identical(round(funs$p(c(0.2, 0.88)), 8), c(0.00275134, 0.02049772))

	expect_identical(round(funs$q(0.2), 5), 5.50687)
	expect_identical(round(funs$q(c(0.2, 0.46)), 5), c(5.50687, 96.20147))
	expect_true(is.na(funs$q(0.7)))

	set.seed(42)
	expect_identical(funs$r(5), c(NA, NA, 13, NA, NA))
	expect_identical(funs$r(5), c(NA, NA, 3, NA, NA))
})
