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

	setNames(
		c(as.list(arms), .Call(C_welch_t_test, x, y, alpha)),
		c("comparator", "target", "est", "p_value", "ci_lo", "ci_hi")
	)
}
