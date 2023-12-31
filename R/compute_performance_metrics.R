#' Computes select Monte Carlo performance measures
#'
#' @param theta_hat vector, estimates
#' @param theta vector, ground truth values (length 1 or as long as `theta_hat`)
#' @param p_value,ci_lo,ci_hi vectors holding the p values as well as lower and upper boundaries of
#'   the confidence intervals corresponding to the alpha (next parameter)
#' @param alpha scalar in `[0, 1]`, equals 1.0 - significance level
#'
#' @keywords internal
#' @return A named numeric vector with the performance measures.
#'
compute_performance_metrics <- function(theta_hat, theta, p_value, ci_lo, ci_hi, alpha = 0.05) {
	# From table 6 in https://doi.org/10.1002/sim.8086
	# and https://www.ellessenne.xyz/2022/11/monte-carlo-errors-for-relative-bias/ (relative bias + its SE)

	n <- length(theta_hat)
	n_prefix <- 1 / (n * (n - 1))

	bias <- fast_mean(theta_hat - theta)
	relative_bias <- fast_mean((theta_hat - theta) / theta)
	mse <- fast_mean((theta_hat - theta)^2)
	# fast_mean only fast for doubles (logicals are integers in R)
	coverage <- sum(ci_lo <= theta & theta <= ci_hi) / n
	rejection_prop <- sum(p_value <= alpha) / n
	be_coverage <- sum(ci_lo <= theta_hat & theta_hat <= ci_hi) / n

	list(
		bias = bias,
		bias_se = sqrt(n_prefix * sum((theta_hat - fast_mean(theta_hat))^2)),
		# TODO: isn't it theta instead of fast_mean(theta_hat)?
		relative_bias = relative_bias,
		relative_bias_se = sqrt(n_prefix * sum(((theta_hat - theta) / theta - relative_bias)^2)),
		mse = mse,
		mse_se = sqrt(n_prefix * sum(((theta_hat - theta)^2 - mse)^2)),
		coverage = coverage,
		coverage_se = sqrt(coverage * (1 - coverage) / n),
		bias_corrected_coverage = be_coverage,
		bias_corrected_coverage_se = sqrt(be_coverage * (1 - be_coverage) / n),
		rejection_proportion = rejection_prop,
		rejection_proportion_se = sqrt(rejection_prop * (1 - rejection_prop) / n)
	)
}
