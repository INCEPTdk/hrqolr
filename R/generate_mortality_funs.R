#' Generate density, probability, quantile and random generation functions for (scaled) empirical
#' mortality distribution
#'
#' The cumulative mortality functions is modelled over that of the CLASSIC trial, but can be scaled
#' to achieve a desired mortality at end of follow-up
#'
#' @param cum_mortality scalar in `[0, 1]`, the cumulative mortality at end of follow-up (= time of
#'   censoring)
#' @param censoring_value the value assigned when a patient is censored, default is `NA`
#'
#' @return A list with the four functions, named `d`, `p`, `q` and `r` to follow R conventions (see,
#'   e.g., `?rnorm`)
#'
generate_mortality_funs <- function(
    cum_mortality = NULL,
    censoring_value = NA
) {

  cdf <- with(CLASSIC_cum_mortality_curve, create_smooth_trajectory(t, p_death))
	cum_mortality <- cum_mortality %||% max(cdf$y)

	cdf$y <- cumsum(c(0, rescale(diff(cdf$y)) * cum_mortality))

  pemp <- function(q) {
    approxfun(cdf$x, cdf$y, method = "linear")(q)
  }

  demp <- function(t) {
    with(cdf, approxfun(x[-length(x)], diff(y)/diff(x)))(t)
  }

  qemp <- function(p) {
    out <- linear_approx(cdf$y, cdf$x, xout = p)
    out[p > max(cdf$y)] <- censoring_value
    out[p == 0] <- 0.0
    out

    # Sampling between x values instead of linear interpolation because the latter
    # will push the eCDF curve upward (aka yielding too many early sampled t_days values)
    # runif(1, tail(cdf[cdf$y <= p, ]$x, 1), head(cdf[cdf$y >= p, ]$x, 1))

  }

  remp <- function(n) {
  	ceiling(qemp(stats::runif(n)))
  }

  list(
    d = demp,
    p = pemp,
    q = qemp,
    r = remp
  )
}
