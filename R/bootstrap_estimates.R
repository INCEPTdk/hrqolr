#' Bootstrap confidence intervals and p values
#'
#' @inheritParams welch_t_test
#' @param n_samples scalar, number of bootstrap samples
#'
#' @keywords internal
#' @return A four-element vector with point estimate, p value and confidence internal
#'
bootstrap_estimates <- function (vals, grps, na_replacement = NULL, n_samples = 2000, alpha = 0.05) {
	if (!is.null(na_replacement)) {
		vals <- replace_na(vals, na_replacement)
	} else {
		na_idx <- is.na(vals)
		vals <- vals[!na_idx]
		grps <- grps[!na_idx]
	}

	boot_samples <- bootstrap_mean_diffs(vals, grps == "ctrl", B = n_samples)
		# must convert grps to integer vector

	# This is one R-only version (some 12-18 times slower, and .Internal() makes R CMD check fail...):
	# bootstrap_fun <- function(i, idx) {
	# 	boot_idx <- sample(idx, replace = TRUE)
	# 	actv_idx <- grps[boot_idx] == "actv"
	# 	.Internal(mean(vals[boot_idx][actv_idx])) -
	# 		.Internal(mean(vals[boot_idx][!actv_idx]))
	# }
	# boot_samples <- sapply(seq_len(n_samples), bootstrap_fun, idx = seq_along(vals))

	est <- .Call("C_Mean", vals[grps == "actv"], PACKAGE = "hrqolr") -
		.Call("C_Mean", vals[grps == "ctrl"], PACKAGE = "hrqolr")
	wald_statistic <- (.Call("C_Mean", boot_samples, PACKAGE = "hrqolr") - est)^2 / stats::var(boot_samples)
	p_value <- 1 - stats::pchisq(wald_statistic, df = 1)
	conf_int <- stats::quantile(boot_samples, c(alpha/2, 1 - alpha/2))

	setNames(c(est, conf_int, p_value), c("point_est", "ci_lo", "ci_hi", "p_values"))
}
