#' Generate density, probability, quantile and random generation functions for
#' (scaled) empirical mortality distribution
#'
#' @param cum_mortality
#' @param censoring_value
#' @param censoring_threshold
#'
#' @return
#' @export
#'
#' @importFrom magrittr %>%
#'
#' @examples
#'
generate_mortality_funs <- function(
    cum_mortality = NULL,
    censoring_value = 181,
    censoring_threshold = NULL
) {

  cdf <- with(CLASSIC_cum_mortality_curve, create_smooth_trajectory(t, p_death))
	cum_mortality <- cum_mortality %||% max(cdf$y)

	cdf$y <- cumsum(c(0, rescale(diff(cdf$y)) * cum_mortality))

	censoring_threshold <- censoring_threshold %||% max(cdf$y)

  pemp <- function(q) {
    approxfun(cdf$x, cdf$y, method = "linear")(q)
  }

  demp <- function(t) {
    with(cdf, approxfun(x[-length(x)], diff(y)/diff(x)))(t)
  }

  qemp <- function(p) {
    out <- fast_approx(cdf$y, cdf$x, xout = p)
    out[p >= censoring_threshold] <- NA
    out[p == 0] <- 0.0
    out

    # if (p >= censoring_threshold) {
    #   return(censoring_value)
    # } else {
    #   if (p == 0) return(0)
    # }

    # Sampling between x values instead of linear interpolation because the latter
    # will push the eCDF curve upward (aka yielding too many early sampled t_days values)
    # runif(1, tail(cdf[cdf$y <= p, ]$x, 1), head(cdf[cdf$y >= p, ]$x, 1))

  }

  remp <- function(n) {
  	ceiling(qemp(runif(n)))
  }

  list(
    d = demp,
    p = pemp,
    q = qemp,
    r = remp
  )
}
