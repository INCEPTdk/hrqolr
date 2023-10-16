#' Scale numeric vector to sum to 1
#'
#' @param x numeric vector, should not contain NA's
#' @keywords internal
#'
rescale <- function(x) {
  x / sum(x)
}


#' Mean value without the housekeeping
#'
#' R's built-it `mean` function has a lot of overhead which is redundant for the internal workings
#' of `hrqolr`.
#'
#' @param x numeric vector
#'
#' @keywords internal
#' @return Scalar with the mean, after handling NA's as per the `na_replacement` parameter
#'
fast_mean <- function(x) {
	sum(x) / length(x)
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
#' @param index_hrqol scalar, HRQoL at time of enrolment (= index)
#' @param t scalar
#' @keywords internal
#'
na_matrix <- function(index_hrqol, t) {
	matrix(
		c(0.0, index_hrqol, t, NA_real_),
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

	est <- mean(vals[grps == "actv"]) - mean(vals[grps == "ctrl"])
	wald_statistic <- (mean(boot_samples) - est)^2 / stats::var(boot_samples)
	p_value <- 1 - stats::pchisq(wald_statistic, df = 1)
	conf_int <- stats::quantile(boot_samples, c(alpha/2, 1 - alpha/2))

	setNames(c(est, conf_int, p_value), c("point_est", "ci_lo", "ci_hi", "p_values"))
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

	as.list(setNames(
		c(stats::quantile(x, probs = probs), mean(x), stats::sd(x), stats::sd(x)/sqrt(length(x))),
		c(paste0("p", 100 * probs), "mean", "sd", "se")
	))
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


#' Verify input is single integer or numeric (potentially within range)
#'
#' Used internally.
#'
#' @param x value to check.
#' @param min_value,max_value single integers or decimal numbers, lower and upper bounds
#'   between which `x` should lie.
#' @param valid_values vector of valid values (only for characters)
#' @param open single character, determines whether `min_value` and `max_value`
#'   are excluded or not. Valid values: `"no"` (= closed interval; `min_value`
#'   and `max_value` included; default value), `"right"`, `"left"`, `"yes"`
#'   (= open interval, `min_value` and `max_value` excluded).
#'
#' @return Single logical.
#'
#' @name verify
#' @keywords internal
#'
NULL

#' Verify integer
#' @describeIn verify Verify input is an integer
#'
verify_int <- function(x, min_value = -Inf, max_value = Inf, open = "no") {
	if (is.null(x)) return(FALSE)
	if (!is.numeric(x)) return(FALSE)
	is_int <- length(x) == 1 & all(!is.na(x)) & all(floor(x) == x)
	is_above_min <- if (open %in% c("left", "yes")) min_value < x else min_value <= x
	is_below_max <- if (open %in% c("right", "yes")) x < max_value else x <= max_value
	all(is_int) & all(is_above_min) & all(is_below_max)
}


#' Verify numeric
#' @describeIn verify Verify input is a numeric
#'
verify_num <- function(x, min_value = -Inf, max_value = Inf, open = "no") {
	if (is.null(x)) return(FALSE)
	if (!is.numeric(x)) return(FALSE)
	is_num <- length(x) == 1 & all(!is.na(x))
	is_above_min <- if (open %in% c("left", "yes")) min_value < x else min_value <= x
	is_below_max <- if (open %in% c("right", "yes")) x < max_value else x <= max_value
	all(is_num) & all(is_above_min) & all(is_below_max)
}


#' Verify string
#' @describeIn verify Verify input is a string of characters, having specific values (if specified)
#'
verify_chr <- function(x, valid_values = NULL) {
	if (is.null(x)) return(FALSE)
	if (!is.character(x)) return(FALSE)
	has_valid_value <- is.null(valid_values) || isTRUE(x %in% valid_values)
	length(x) == 1 && all(!is.na(x)) && has_valid_value
}


#' Padding of string
#'
#' @param x string, to be padded
#' @param n int, number of padding characters to add
#' @param pad string, padding character(s)
#' @param side string, where to pad `x` (default: `"right"`)
#'
#' @return Padded character
#' @keywords internal
#'
pad <- function(x, n, pad = " ", side = "right") {
	full_pad <- paste0(rep(pad, max(0, n - nchar(x))), collapse = "")
	if (side == "left") paste0(full_pad, x) else paste0(x, full_pad)
}


#' Colour text if crayon package is available
#'
#' @param x string to be coloured
#' @param style string, must be a valid `crayon` style
#'
#' @return Coloured string (if crayon available), otherwise the string remains unaltered
#' @keywords internal
#'
crayon_style <- function(x, style) {
	tryCatch(crayon::style(x, style), error = function(e) x)
}


#' Estimate node size
#'
#' Based on pryr:::node_size().
#'
#' @keywords internal
#' @return Nothing
#'
node_size <- function() {
	bit <- 8L * .Machine$sizeof.pointer
	if (bit == 64L) 56L else if (bit == 32L) 28L else NA
}
