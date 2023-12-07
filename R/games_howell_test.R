#' Compute p values and confidence intervals a.m. Games Howell
#'
#' @inheritParams welch_t_test
#'
#' @export
#' @return A data.table with one row per pairwise comparison and six columns: comparator, target,
#'   estimate (= mean difference), p value as well as lower and upper bounds of the confidence interval
#'   corresponding to the `alpha` parameter.
#'
games_howell_test <- function(vals, grps, arms = unique(grps), na_replacement = NULL, alpha = 0.05) {
	# Based heavily on https://rpubs.com/aaronsc32/games-howell-test

	if (!is.null(na_replacement)) {
		vals <- replace_na(vals, na_replacement)
	} else {
		na_idx <- is.na(vals)
		vals <- vals[!na_idx]
		grps <- grps[!na_idx]
	}

	grp_combos <- utils::combn(unique(grps), 2)

	n_vals <- tapply(vals, grps, length)
	n_grps <- length(tapply(vals, grps, length))
	mu <- tapply(vals, grps, mean) # group-wise means
	sigma2 <- tapply(vals, grps, stats::var) # group-wise variances

	comparisons <- apply(grp_combos, 2, function(col) {
		mean_diff <- diff(mu[col])

		n1 <- n_vals[col[1]]
		n2 <- n_vals[col[2]]
		var1 <- sigma2[col[1]]
		var2 <- sigma2[col[2]]

		t_stat <- abs(mean_diff) / sqrt(var1 / n1 + var2 / n2)
		df <- (var1 / n1 + var2 / n2)^2 /
			((var1 / n1)^2 / (n1 - 1) + (var2 / n2)^2 / (n2 - 1))
		se <- sqrt(0.5 * (var1 / n1 + var2 / n2))

		p_value <- stats::ptukey(t_stat * sqrt(2), n_grps, df, lower.tail = FALSE)
		conf_int <- mean_diff + c(-1, 1) * stats::qtukey(1 - alpha, nmeans = n_grps, df = df) * se

		list(
			comparator = col[1],
			target = col[2],
			est = mean_diff,
			p_value = p_value,
			ci_lo = conf_int[1],
			ci_hi = conf_int[2]
		)
	})

	data.table::rbindlist(comparisons)
}
