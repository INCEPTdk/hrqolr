#' Scale numeric vector to sum to 1
#'
#' @param x numeric vector, should not contain NA's
#' @keywords internal
#'
rescale <- function(x) {
  x / sum(x)
}


#' Compute deterministic day of hospital discharge based on day of ICU discharge
#'
#' @param t_icu_discharge int, day of ICU discharge
#' @keywords internal
#'
compute_hosp_discharge <- function(t_icu_discharge) {
	ceiling(t_icu_discharge^0.518 * 9.310)
}

#' Default value for NULL
#'
#' Infix function for easy replacement of NULL with a default value.
#'
#' @param a,b arbitrary vectors
#' @keywords internal
#' @name OR
#'
`%||%` <- function(a, b) if (is.null(a)) b else a


#' Default value for infinities
#'
#' Infix function for easy replacement of -Inf/Inf with a default value.
#'
#' @param a,b arbitrary vectors
#' @keywords internal
#'
`%fi%` <- function(a, b) {
	if (is.infinite(a)) b else a
}


#' Create "empty" observation tibble
#'
#' Useful for patients for whom no data are every observed.
#'
#' @param t scalar
#' @keywords internal
#'
na_matrix <- function(t) {
	matrix(
		c(0.0, 0.0, t, NA_real_),
		ncol = 2,
		byrow = TRUE,
		dimnames = list(NULL, c("x", "y"))
	)
}


#' Create xout vector for approx()
#'
#' Cached. Used in `construct_final_trajectories()`.
#'
#' @inheritParams base::seq
#' @keywords internal
#'
create_xout <- function(start, end, by) {
	unique(c(0.0, seq(start, end, by), end))
}


#' Helper for printing time difference to stdout as message
#'
#' @param start_time,now output from `Sys.time()`
#' @param mess str, message to print
#' @keywords internal
#'
log_timediff <- function(start_time, mess = NULL, now = Sys.time()) {
	dt <- now - start_time
	message(round(now), ": ", mess, " (", round(dt, 2), " ", attr(dt, "units"), ")")
}


#' Compute end of follow-up
#'
#' Cached. Based entirely on day of ICU discharge and sampling frequency
#'
#' @param t_icu_discharge int, day of ICU discharge
#' @param approx_end int, the approximate end day (follow-up will not be shorter than this)
#' @param sampling_frequency int, period between samplings of HRQoL
#'
compute_eof <- function(t_icu_discharge, approx_end = 180, sampling_frequency = 14) {
	ceiling((approx_end - t_icu_discharge) / sampling_frequency) * sampling_frequency + t_icu_discharge
}


#' Give arm variable proper form and names
#'
#' @param arm character vector, will be converted to factor and renamed
#'
#' @return A factor with the right labels in the right order for pretty printing and plotting
#' @keywords internal
#'
beautify_arm_var <- function(arm) {
	factor(
		ifelse(arm == "actv", "intervention", "control"),
		levels = c("intervention", "control")
	)
}


#' Default value for NA's
#'
#' Helper function for simple handling of missing values in vectors. No type checking done.
#'
#' @param x arbitrary vector
#' @param replacement replacement value
#'
#' @return x vector in which NA's have been replaced with `replacement`.
#' @keywords internal
#'
replace_na <- function(x, replacement) {
	x[is.na(x)] <- replacement # in-place replacement much faster than returning new vector with NA's replaced
	return(x)
}


#' Welch's t test
#'
#' Custom and stripped-down version of R's built-in t.test that yields the
#' estimate with the confidence interval corresponding to the specified alpha
#' level.
#'
#' @param vals numeric vector
#' @param grps character vector, allowed values are "ctrl" and "actv" and used to
#'   slice `x` into two vectors with values to be compared.
#' @param alpha numeric, 1.0 - confidence_level
#'
#' @keywords internal
#' @return A four-element vector with point estimate, p value and confidence internal
#'
welch_t_test <- function (vals, grps, na_replacement = NULL, alpha = 0.05) {
	if (!is.null(na_replacement)) {
		vals <- replace_na(vals, na_replacement)
	} else {
		na_idx <- is.na(vals)
		vals <- vals[!na_idx]
		grps <- grps[!na_idx]
	}

	# Extract values for the two groups
	x <- vals[grps == "actv"]
	y <- vals[grps == "ctrl"]

	nx <- length(x)
	mx <- mean(x)
	stderrx <- sqrt(stats::var(x) / nx)

	ny <- length(y)
	my <- mean(y)
	stderry <- sqrt(stats::var(y) / ny)

	stderr <- sqrt(stderrx^2 + stderry^2)

	df <- stderr^4 / (stderrx^4 / (nx - 1) + stderry^4 / (ny - 1))
	tstat <- (mx - my) / stderr
	p_value <- 2 * stats::pt(-abs(tstat), df)
	conf_int <- stderr * (tstat + c(-1, 1) * stats::qt(1 - alpha * 0.5, df))

	setNames(c(mx - my, p_value, conf_int), c("est", "p_value", "ci_lo", "ci_hi"))
}

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

	# This is one R-only version (some 12-18 times slower):
	# bootstrap_fun <- function(i, idx) {
	# 	boot_idx <- sample(idx, replace = TRUE)
	# 	actv_idx <- grps[boot_idx] == "actv"
	# 	.Internal(mean(vals[boot_idx][actv_idx])) -
	# 		.Internal(mean(vals[boot_idx][!actv_idx]))
	# }
	# boot_samples <- sapply(seq_len(n_samples), bootstrap_fun, idx = seq_along(vals))

	est <- mean(vals[grps == "actv"]) - mean(vals[grps == "ctrl"])
	wald_statistic <- (mean(boot_samples) - est)^2 / stats::var(boot_samples)
	p_value <- 1 - stats::pchisq(wald_statistic, df = 1)
	conf_int <- stats::quantile(boot_samples, c(alpha/2, 1 - alpha/2))

	setNames(c(est, conf_int, p_value), c("point_est", "ci_lo", "ci_hi", "p_values"))
}


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
	bias <- mean(theta_hat - theta)
	relative_bias <- mean((theta_hat - theta) / theta)
	mse <- mean((theta_hat - theta)^2)
	coverage <- mean(ci_lo <= theta & theta <= ci_hi)
	rejection_prop <- mean(p_value <= alpha)
	be_coverage <- mean(ci_lo <= mean(theta_hat) & mean(theta_hat) <= ci_hi)

	c(
		bias = bias,
		bias_se = sqrt(n_prefix * sum((theta_hat - mean(theta_hat))^2)),
			# TODO: isn't it theta instead of mean(theta_hat)?
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


#' Sample time to ICU discharge
#'
#' Helper function.
#'
#' @param n int, number of times to ICU discharge to sample.
#'
#' @return numeric vector of length `n` with sampled times.
#' @keywords internal
#'
sample_t_icu_discharge <- function(n) {
	ceiling(stats::rlnorm(n = n, meanlog = log(5), sdlog = log(2) * 1.4826))
}


#' Summarise a variable with common statistics
#'
#' Input e.g. a scalar to get the corresponding names
#'
#' @param x numeric vector
#' @param probs probabilities for which to compute the quantiles
#' @param na_rm logical, should NA's be removed (default: `TRUE`)
#'
#' @keywords internal
#'
summarise_var <- function(x, probs = c(0.25, 0.5, 0.75), na_rm = TRUE) {
	if (isTRUE(na_rm)) x <- x[!is.na(x)]

	setNames(
		c(stats::quantile(x, probs = probs), mean(x), stats::sd(x), stats::sd(x)/sqrt(length(x))),
		c(paste0("p", 100 * probs), "mean", "sd", "se")
	)
}


#' Compute area under the curve
#'
#' Assumes x and y are the same length. Checking will mean huge performance hit.
#'
#' @param x,y vectors, coordinates of the curve under which the area is to be
#'   computed
#'
#' @return scalar
#' @keywords internal
#'
auc <- function(x, y) {
	n <- length(x)

	dy <- y[-1] - y[-n]
	dx <- x[-1] - x[-n]

	sum(
		dx * y[-n], # rectangles
		dx * dy * 0.5 # triangles
	)
}


#' stop() and warning() with call. = FALSE
#'
#' Used internally. Calls [stop0()] or [warning()] but enforces `call. = FALSE`,
#' to suppress the call from the error/warning.
#'
#' @inheritParams base::stop
#'
#' @return NULL
#'
#' @keywords internal
#'
#' @name stop0_warning0
#'
stop0 <- function(...) stop(..., call. = FALSE)

#' @rdname stop0_warning0
#' @keywords internal
warning0 <- function(...) warning(..., call. = FALSE)


#' vapply helpers
#'
#' Used internally. Helpers for simplifying code invoking vapply().
#'
#' @inheritParams base::vapply
#'
#' @keywords internal
#'
#' @name vapply_helpers
#'
vapply_num <- function(X, FUN, ...) vapply(X, FUN, FUN.VALUE = numeric(1), ...)

#' @rdname vapply_helpers
#' @keywords internal
vapply_int <- function(X, FUN, ...) vapply(X, FUN, FUN.VALUE = integer(1), ...)

#' @rdname vapply_helpers
#' @keywords internal
vapply_str <- function(X, FUN, ...) vapply(X, FUN, FUN.VALUE = character(1), ...)

#' @rdname vapply_helpers
#' @keywords internal
vapply_lgl <- function(X, FUN, ...) vapply(X, FUN, FUN.VALUE = logical(1), ...)


#' Check availability of required packages
#'
#' Used internally, helper function to check if SUGGESTED packages are
#' available. Will halt execution if any of the queried packages are not
#' available and provide installation instructions.
#'
#' @param pkgs, character vector with name(s) of package(s) to check.
#'
#' @return `TRUE` if all packages available, otherwise execution is halted with
#'   an error.
#'
#' @keywords internal
#'
assert_pkgs <- function(pkgs = NULL) {
	checks <- vapply_lgl(pkgs, function(p) isFALSE(requireNamespace(p, quietly = TRUE)))
	unavailable_pkgs <- names(checks[checks])

	if (any(checks)) {
		stop0(
			"Could not load the following required package(s)",
			paste(unavailable_pkgs, collapse = ", "),
			". \nConsider installing with the following command: ",
			sprintf(
				"install.packages(%s)",
				paste0(
					if (sum(checks) > 1) "c(" else "",
					paste0("\"", unavailable_pkgs, "\"", collapse = ", "),
					if (sum(checks) > 1) ")" else ""
				)
			)
		)
	}

	return(TRUE)
}


# Legacy (to be removed later) ====

#' Fast approximation function
#'
#' This function essentially strips unnecessary housekeeping from
#' stats::approx() to yield some 30x speed-up. Note that this function call
#' non-exported code from the stats package, so I've made a C++ equivalent (otherwise the package
#' will go get on CRAN).
#'
#' @inheritParams stats::approx
#' @param method int, 1 = linear, 2 = constant
#'
#' @keywords internal
#' @noRd
#' @return interpolated value(s) corresponding to `xout`
#'
fast_approx <- function(x, y, xout, method = 1, na.rm = TRUE) {
	# .Call(stats:::C_Approx, x, y, xout, method, NA, NA, 0, na.rm)
}


#' Plot simulations
#'
#' NB! This is an old function that might be useful and, thus, kept.
#'
#' @param sim_object
#'
# @importFrom ggplot2 ggplot aes geom_line geom_point theme_minimal stat_ecdf after_stat
# @importFrom patchwork / + plot_layout
# @importFrom dplyr filter group_by slice_max
#'
#' @noRd
#'
# plot_sim <- function(sim_object) {
# 	p_trajectories <- ggplot(sim, aes(x, y)) +
# 		geom_line(aes(colour = arm, group = patient_id), linewidth = 0.3) +
# 		geom_point(aes(colour = arm, group = patient_id), ~ filter(group_by(., patient_id), n() == 1)) +
# 		theme_minimal()
#
# 	p_at_risk <- ggplot(slice_max(group_by(sim, patient_id), x), aes(x, colour = arm)) +
# 		stat_ecdf(aes(y = after_stat(1 - y)), pad = FALSE, show.legend = FALSE) +
# 		theme_minimal()
#
# 	p_trajectories / p_at_risk +
# 		plot_layout(heights = c(5, 1), guides = "collect")
# }
