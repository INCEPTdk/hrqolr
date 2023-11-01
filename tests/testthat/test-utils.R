test_that("Rescaling works", {
	expect_equal(
		rescale(c(1, 2, 4, 6, 7)),
		c(0.05, 0.10, 0.20, 0.30, 0.35)
	)

	expect_true(all(is.na(rescale(c(NA, 1:10)))))
	expect_equal(rescale(c(Inf, 1, 2)), c(NA, 0, 0))
	expect_equal(rescale(c(-Inf, 1, 2)), c(NA, 0, 0))
})

test_that("Misc. utils", {
	# na_matrix ====
	expect_equal(
		na_matrix(0.2, 5),
		matrix(c(0, 5, 0.2, NA_real_), ncol = 2, dimnames = list(NULL, c("x", "y")))
	)

	# replace_na ====
	expect_error(replace_na(c(NA, 1, 2)))
	expect_equal(replace_na(c(NA, 1, 2), 0), c(0, 1, 2))
	expect_equal(replace_na(c(NA, 1, 2), NA), c(NA, 1, 2))
	expect_equal(replace_na(c(NULL, 1, 2), 0), c(1, 2))
	expect_error(replace_na(c(NA, 1, 2), NULL))

	# create_xout ====
	expect_equal(create_xout(1, 10, 3), c(0, 1, 4, 7, 10))
	expect_equal(create_xout(1, 11, 3), c(0, 1, 4, 7, 10, 11))
	expect_error(create_xout(1, NA, 3))
	expect_error(create_xout(NA, NA, 3))
	expect_error(create_xout(NA, 10, 3))

	# log_timediff
	expect_snapshot(log_timediff(
		start = as.POSIXct("2023-10-25 10:00:00 CEST"),
		msg = "Message",
		now = as.POSIXct("2023-10-25 11:00:00 CEST")
	))

	# compute_eof ====
	expect_equal(compute_eof(5), 187)
	expect_equal(compute_eof(10), 192)
	expect_equal(compute_eof(15), 183)
	expect_equal(compute_eof(10, approx_end = 365), 374)
	expect_equal(compute_eof(15, approx_end = 365), 365)

	# compute_hosp_discharge ====
	expect_equal(
		compute_hosp_discharge(1:10),
		c(10, 14, 17, 20, 22, 24, 26, 28, 30, 31)
	)
	expect_equal(compute_hosp_discharge(c(NA, 1, 5)), c(NA, 10, 22))

	# sample_t_icu_discharge ====
	set.seed(42)
	expect_equal(
		sample_t_icu_discharge(10),
		c(21, 3, 8, 10, 8, 5, 24, 5, 40, 5)
	)

	# auc ====
	expect_equal(auc(1:10, c(6:10, 1:5)), 49.5)
	expect_warning(auc(1:10, 1:9))
	expect_true(is.na(auc(1:10, c(1:9, NA))))

	# assert_pkgs ====
	expect_true(assert_pkgs("stats"))
	expect_error(assert_pkgs("ThisPackageDoesNotExist"))
	expect_error(assert_pkgs(c("ThisPackageDoesNotExist", "ThisOneNeither")))
})

test_that("summarise_vars works", {
	x <- c(0.52, 0.13, 0.72, 0.02, 0.77, 0.71, 0.53, 0.67, 0.59, 0.84)
	expect_snapshot(summarise_var(x))
	expect_snapshot(hrqolr:::summarise_var(x, probs = c(0.025, 0.5, 0.975)))

	expect_snapshot(summarise_var(c(x, NA)))
	expect_error(summarise_var(c(x, NA), na_rm = FALSE))

})

test_that("verify_int works", {
	expect_true(verify_int(2, 1, 3))
	expect_true(verify_int(2, -1, 3))
	expect_false(verify_int(2, -1, 1))

	# Right boundary
	expect_true(verify_int(2, -1, 2, "no"))
	expect_true(verify_int(2, -1, 2, "left"))
	expect_false(verify_int(2, -1, 2, "yes"))
	expect_false(verify_int(2, -1, 2, "right"))

	# Left boundary
	expect_true(verify_int(-1, -1, 2, "no"))
	expect_false(verify_int(-1, -1, 2, "left"))
	expect_false(verify_int(-1, -1, 2, "yes"))
	expect_true(verify_int(-1, -1, 2, "right"))

	# Invalid input types
	expect_false(verify_int(NULL))
	expect_false(verify_int(-5:5))
	expect_false(verify_int(1.8))
	expect_false(verify_int("Hello"))
})

test_that("verify_num works", {
	expect_true(verify_num(1.8))

	expect_true(verify_num(2, 1, 3))
	expect_true(verify_num(2, -1, 3))
	expect_false(verify_num(2, -1, 1))

	# Right boundary
	expect_true(verify_num(2, -1, 2, "no"))
	expect_true(verify_num(2, -1, 2, "left"))
	expect_false(verify_num(2, -1, 2, "yes"))
	expect_false(verify_num(2, -1, 2, "right"))

	# Left boundary
	expect_true(verify_num(-1, -1, 2, "no"))
	expect_false(verify_num(-1, -1, 2, "left"))
	expect_false(verify_num(-1, -1, 2, "yes"))
	expect_true(verify_num(-1, -1, 2, "right"))

	# Invalid input types
	expect_false(verify_num(NULL))
	expect_false(verify_num(-5:5))
	expect_false(verify_num("Hello"))
})

test_that("verify_chr works", {
	expect_true(verify_chr("hello world"))
	expect_true(verify_chr("hello", c("hello", "world")))
	expect_false(verify_chr("Hello", c("hello", "world")))

	# Numerics are converted to
	expect_false(verify_chr(NULL))
	expect_false(verify_chr(2L))
	expect_false(verify_chr(2.0))
	expect_false(verify_chr(c("hello", "world")))
})

test_that("NULL- and Inf-replacement works", {
	x <- NULL
	y <- 1
	z <- 3
	expect_identical(x %||% y, y)
	expect_identical(y %||% x, y)
	expect_identical(y %||% z, y)

	x <- Inf
	expect_identical(x %fi% y, y)
	expect_identical(y %fi% x, y)
	expect_identical(y %fi% z, y)
})

test_that("vapply helpers work", {
	expect_equal(vapply_num(1:3, function(x) x * 2), c(2.0, 4.0, 6.0))

	expect_equal(vapply_int(1:3, function(x) x * 2L), c(2L, 4L, 6L))
	expect_error(vapply_int(1:3, function(x) x * 2))

	expect_equal(vapply_str(1:3, function(x) paste0("p", x*10)), c("p10", "p20", "p30"))

	expect_equal(
		vapply_lgl(c(1, 2.0, 3, 4.0), verify_int, min_value = 2),
		c(FALSE, TRUE, TRUE, TRUE)
	)

	expect_equal(
		vapply_lgl(c(1, 2.5, 3, 4.0), verify_int, min_value = 2),
		c(FALSE, FALSE, TRUE, TRUE)
	)
})

test_that("stop0, warning0 and cat0 work", {
	expect_snapshot_error(stop0("error message"))

	expect_snapshot_warning(warning0("warning message"))
})

test_that("Print methods work", {
	b10 <- structure(10, class = "hrqolr_bytes")
	expect_output(print(b10), "10 B")

	kb10 <- structure(10000, class = "hrqolr_bytes")
	expect_output(print(kb10), "10 kB")

	mb10 <- structure(10e6, class = "hrqolr_bytes")
	expect_output(print(mb10), "10 MB")
})