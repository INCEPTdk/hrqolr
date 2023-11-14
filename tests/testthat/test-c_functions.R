test_that("C_approx works", {
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

test_that("C_mean works", {
	expect_equal(fast_mean(as.double(1:10)), 5.5)

	expect_error(fast_mean(1:10)) # int input won't work
	expect_true(is.na(fast_mean(c(as.double(1:10), NA))))
	expect_error(fast_mean(LETTERS))
})

test_that("C_bootstrap_mean_diffs works", {
	x <- c(
		0.8, -0.83, 0.49, 1.06, 0.99, 0.27, 2.66, 2.09, -0.53, -0.94,  0.27, 0.61,
		-0.53, 1.77, 0.47, -0.68, -0.59, -1.01, -0.24, 0.15,  -2.55, 0.18, -1.51, 0,
		-1.63, -1.77, -0.12, -0.34, -0.73, -0.96,  0.06, -0.56, 0.88, 0.61, -1.17,
		1.49, -1.49, -1.43, -0.57, -1.86
	)
	g <- rep(0:1, length(x) / 2)
	set.seed(42)
	expect_equal(
		bootstrap_estimates(x, g),
		c(point_est = 0.1445, ci_lo = -0.53609, ci_hi = 0.855255208333333, p_value = 0.993060740290883)
	)
})

test_that("C_welch_t_test works", {
	x <- as.double(1:10)
	y <- as.double(6:15)
	alpha <- 0.05
	welch_hrqolr <- .Call(C_welch_t_test, x, y, alpha)
	welch_stats <- with(
		stats::t.test(x, y, var.equal = FALSE, conf.level = 1 - alpha),
		as.numeric(c(est = mean(x) - mean(y), p.value, conf.int)) # t.test doesn't return point estimate
	)
	expect_equal(welch_hrqolr, welch_stats)
})
