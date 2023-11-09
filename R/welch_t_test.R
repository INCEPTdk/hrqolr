#' Welch's t test
#'
#' Custom and stripped-down version of R's built-in t.test that yields the estimate with the
#' confidence interval corresponding to the specified alpha level.
#'
#' @param vals numeric vector
#' @param grps character vector, allowed values are "ctrl" and "actv" and used to slice `x` into two
#'   vectors with values to be compared.
#' @param arms character vector with the arms used in the `grps` parameter. The first value will be
#'   used as the comparator.
#' @param na_replacement scalar (or `NULL`), if `NULL` missing values will be removed. Otherwise,
#'   missing values will be replaced by the value of `na_replacement`
#' @param alpha numeric, 1.0 - confidence_level
#'
#' @export
#' @return A four-element vector with point estimate, p value and confidence internal
#'
welch_t_test <- function (vals, grps, arms = unique(grps), na_replacement = NULL, alpha = 0.05) {
	if (!is.null(na_replacement)) {
		vals[is.na(vals)] <- na_replacement
	} else {
		na_idx <- is.na(vals)
		vals <- vals[!na_idx]
		grps <- grps[!na_idx]
	}

	# Extract values for the two groups
	x <- vals[grps == arms[2]]
	y <- vals[grps == arms[1]]

	nx <- length(x)
	mx <- fast_mean(x)
	stderrx <- sqrt(stats::var(x) / nx)

	ny <- length(y)
	my <- fast_mean(y)
	stderry <- sqrt(stats::var(y) / ny)

	stderr <- sqrt(stderrx^2 + stderry^2)

	df <- stderr^4 / (stderrx^4 / (nx - 1) + stderry^4 / (ny - 1))
	t_stat <- (mx - my) / stderr
	p_value <- 2 * stats::pt(-abs(t_stat), df)
	conf_int <- stderr * (t_stat + c(-1, 1) * stats::qt(1 - alpha * 0.5, df))

	list(
		comparator = arms[1],
		target = arms[2],
		est = mx - my,
		p_value = p_value,
		ci_lo = conf_int[1],
		ci_hi = conf_int[2]
	)
}
