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
	bias <- .Call("C_Mean", theta_hat - theta, PACKAGE = "hrqolr")
	relative_bias <- .Call("C_Mean", (theta_hat - theta) / theta, PACKAGE = "hrqolr")
	mse <- .Call("C_Mean", (theta_hat - theta)^2, PACKAGE = "hrqolr")
	coverage <- .Call("C_Mean", ci_lo <= theta & theta <= ci_hi, PACKAGE = "hrqolr")
	rejection_prop <- .Call("C_Mean", p_value <= alpha, PACKAGE = "hrqolr")
	be_coverage <- .Call("C_Mean", ci_lo <= theta_hat, PACKAGE = "hrqolr") &
		.Call("C_Mean", theta_hat <= ci_hi, PACKAGE = "hrqolr")

	list(
		bias = bias,
		bias_se = sqrt(n_prefix * sum((theta_hat - .Call("C_Mean", theta_hat, PACKAGE = "hrqolr"))^2)),
		# TODO: isn't it theta instead of .Call("C_Mean", theta_hat)?
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
