test_that("Games-Howell test works", {
	x <- c(0.746, 0.023, 0.466, 0.215, 0.521, 0.651, 0.69, 0.526, 0.924, 0.478, 0.12, 0.311)
	g <- rep(1:3, each = 4)
	expect_snapshot(games_howell_test(x, g))

	x <- c(NA, 0.023, 0.466, 0.215, 0.521, 0.651, 0.69, 0.526, 0.924, 0.478, 0.12, 0.311)
	g <- rep(1:3, each = 4)
	expect_snapshot(games_howell_test(x, g, na_replacement = 0))

	# Welch's test is the special case with just two groups
	g <- rep(1:2, each = 6)
	expect_equal(
		t.test(x[g == 1], x[g == 2], var.equal = FALSE)$p.value,
		games_howell_test(x, g)$p_value
	)
})
