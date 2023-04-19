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
    cum_mortality = 0.5,
    censoring_value = 181,
    censoring_threshold = NULL
) {

  df <- tibble::tribble(
    ~ label, ~ t_days, ~ n_alive,
    "baseline", 0, 451,
    "icu_discharge", 15, 345,
    "hosp_discharge", 33, 280,
    "fu_90_days", 90, 257,
    "fu_180_days", 180, 252
  )
  df$prop_dead <- with(df, 1 - n_alive / max(n_alive))

  cdf <- create_trajectory(df$t_days, df$prop_dead)

  for (i in 2:nrow(cdf)) {
    cdf[i, "y"] <- max(cdf[i, "y"], cdf[i-1, "y"])
  }

  cdf$y <- cumsum(c(0, rescale(diff(cdf$y)) * cum_mortality))
  censoring_threshold <- censoring_threshold %||% max(cdf$y)

  pemp <- function(q) {
    approxfun(cdf$x, cdf$y, method = "constant")(q)
  }

  demp <- function(t) {
    with(cdf, approxfun(x[-length(x)], diff(y)/diff(x)))(t)
  }

  qemp <- function(p) {
    if (p >= censoring_threshold) {
      return(censoring_value)
    } else {
      if (p == 0) return(0)
    }

    # Sampling between x values instead of linear interpolation because the latter
    # will push the ECDF curve upward (aka yielding too many early sampled t_days values)
    runif(1, tail(cdf[cdf$y <= p, ]$x, 1), head(cdf[cdf$y >= p, ]$x, 1))
  }

  remp <- function(n) {
    purrr:::map_dbl(runif(n), qemp)
  }

  list(
    d = demp,
    p = pemp,
    q = qemp,
    r = remp
  )
}
