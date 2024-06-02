#' Generate density, probability, quantile and random generation functions for
#' (scaled) empirical mortality distribution
#'
#' The cumulative mortality functions is modelled over that of the CLASSIC trial
#' (see details), but can be scaled to achieve a desired mortality at end of
#' follow-up
#'
#' @param cum_mortality scalar in `[0, 1]`, the cumulative mortality at end of
#'   follow-up (= time of censoring)
#' @param censoring_value the value assigned when a patient is censored, default
#'   is `NA`
#'
#' @details The built-in cumulative mortality function is based on results from
#'   the standard arm in the Conservative versus Liberal Approach to Fluid
#'   Therapy of Septic Shock in Intensive Care (CLASSIC) trial (see references
#'   below).
#'
#' @references
#'
#' Meyhoff TS et al. (2022). Restriction of Intravenous Fluid in ICU
#' Patients with Septic Shock. N Engl J Med
#' (https://doi.org/10.1056/NEJMoa2202707).
#'
#' Kjaer M-BN et al. (2023). Long-term effects of restriction of intravenous
#' fluid in adult ICU patients with septic shock. Intensive Care Med
#' (https://doi.org/10.1007/s00134-023-07114-8)
#'
#' @return A list with the four functions, named `d`, `p`, `q` and `r` to follow
#'   R conventions (see, e.g., `?rnorm`)
#'
generate_mortality_funs <- function(
    cum_mortality = NULL,
    censoring_value = NA
) {

	hash <- rlang::hash(c("generate_mortality_funs", cum_mortality, censoring_value))
	out <- .hrqolr_cache_user$get(hash)

	if (!fastmap::is.key_missing(out)) {
		return(out)
	}

  cdf <- with(cum_mort_classic_standard_arm, create_smooth_trajectory(t, p_death))
	cum_mortality <- cum_mortality %||% max(cdf$y)

	cdf$y <- cumsum(c(0, rescale(diff(cdf$y)) * cum_mortality))

  pemp <- function(q) {
    stats::approxfun(cdf$x, cdf$y, method = "linear")(q)
  }

  demp <- function(t) {
    with(cdf, stats::approxfun(x[-length(x)], diff(y)/diff(x)))(t)
  }

  qemp <- function(p) {
  	out <- hrqolr_approx(cdf$y, cdf$x, p, 0, censoring_value)
    out[p == 0] <- 0.0
    out

    # Linear interpolation actually yields too many early sampled t_days values. This can be
    # remedied by sampling like the following, but it's a lot slower:
    # runif(1, tail(cdf[cdf$y <= p, ]$x, 1), head(cdf[cdf$y >= p, ]$x, 1))

  }

  remp <- function(n) {
  	ceiling(qemp(stats::runif(n)))
  }

  out <- list(
    d = demp,
    p = pemp,
    q = qemp,
    r = remp
  )

  if (!is.null(hash)) {
  	.hrqolr_cache_user$set(hash, out)
  }

  return(out)
}
