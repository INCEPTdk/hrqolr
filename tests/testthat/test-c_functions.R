test_that("C_Approx works", {
	x <- 1:10
	y <- c(1, 3, 2, 5, 1, 2, 1, 4, 4, 5)
	expect_identical(hrqolr_approx(x, y, xout = 4.5), 3)

	x <- 1:10
	y <- c(1, 3, 2, 5, 1, 2, 1, 4, 4, NA)
	expect_identical(hrqolr_approx(x, y, xout = 4.5), 3)

	x <- 1:10
	y <- c(1, 3, 2, NA, 1, 2, 1, 4, 4, NA)
	expect_true(is.na(hrqolr_approx(x, y, xout = 4.5)))
})

test_that("C_Mean works", {
	expect_equal(fast_mean(as.double(1:10)), 5.5)

	expect_error(fast_mean(1:10)) # int input won't work
	expect_true(is.na(fast_mean(c(as.double(1:10), NA))))
	expect_error(fast_mean(LETTERS))
})
