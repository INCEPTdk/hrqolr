#' Bootstrap confidence intervals and p values
#'
#' @inheritParams welch_t_test
#' @param reference_arm character vector of length 1, name of the reference arm in `grps`
#' @param n_samples single integer, number of bootstrap samples
#'
#' @export
#' @return A four-element vector with point estimate, p value and confidence internal
#'
bootstrap_estimates <- function (
		vals,
		grps,
		reference_arm = sort(unique(grps))[[1]],
		na_replacement = NULL,
		n_samples = 2000,
		alpha = 0.05
) {

	if (!is.null(na_replacement)) {
		vals[is.na(vals)] <- na_replacement
	} else {
		na_idx <- is.na(vals)
		vals <- vals[!na_idx]
		grps <- grps[!na_idx]
	}

	vals <- as.double(vals)

	boot_samples <- .Call(
		C_bootstrap_mean_diffs,
		vals,
		grps == reference_arm, # must be integer input
		n_samples
	)

	boot_samples <- boot_samples[!is.na(boot_samples)]
		# happens in the unlikely event that all values are taken from the same arm
		# in which case the mean difference is undefined

	# This is one R-only version (some 12-18 times slower):
	# bootstrap_fun <- function(i, idx) {
	# 	boot_idx <- sample(idx, replace = TRUE)
	# 	ref_idx <- grps[boot_idx] == reference_arm
	# 	fast_mean(vals[boot_idx][!ref_idx]) - fast_mean(mean(vals[boot_idx][ref_idx]))
	# }
	# boot_samples <- sapply(seq_len(n_samples), bootstrap_fun, idx = seq_along(vals))

	est <- fast_mean(vals[grps != reference_arm]) - fast_mean(vals[grps == reference_arm])
	wald_statistic <- (fast_mean(boot_samples) - est)^2 / stats::var(boot_samples)
	p_value <- 1 - stats::pchisq(wald_statistic, df = 1)
	conf_int <- stats::quantile(boot_samples, c(alpha/2, 1 - alpha/2))

	setNames(c(est, conf_int, p_value), c("point_est", "ci_lo", "ci_hi", "p_value"))
}
