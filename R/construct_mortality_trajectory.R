#' Title
#'
#' @inheritParams construct_arm_level_trajectory
#' @param t_death numeric scalar, time of death. NA represent administrative censoring (i.e., the
#'   patient was still alive at end of follow-up)
#' @param shape string, should be any of the following four: `"exp_decay"` (default), `"linear"`,
#'   `"constant"`, `"reflected_exp_decay"`
#' @param resolution int, the number of grid points on the HRQoL trajectory between ICU discharge
#'   and time of death
#'
#' @return Two-column matrix: x is time, y is the HRQoL.
#' @keywords internal
#'
construct_mortality_trajectory <- function(
		t_death,
		t_icu_discharge,
		start_hrqol = 0.0,
		shape = "exp_decay",
		resolution = 100
) {

	t_grid <- seq(t_icu_discharge, t_death, length = resolution)

	if (shape == "linear") {
		hrqol <- fast_approx(
			x = c(t_icu_discharge, t_death),
			y = c(start_hrqol, 0.0),
			xout = t_grid
		) # TODO: maybe just do: hrqol = c(start_hrqol, 0.0))
	} else if (shape == "constant") {
		hrqol <- rep(start_hrqol, resolution) # TODO: similar to above w/o unnecessary repetitions
	} else {
		t_half <- find_decay_halflife(t_death - t_icu_discharge)
		t_diff <- t_grid - t_icu_discharge
		hrqol <- start_hrqol * 2.0^(-t_diff / t_half)
		hrqol[length(hrqol)] <- 0.0 # enforce HRQoL at day of death
		hrqol

		if (shape == "reflected_exp_decay") {
			# Essentially rotates the trajectory 180 degrees
			hrqol <- start_hrqol - hrqol
			t_grid <- rev(t_grid)
		}
	}

	matrix(
		c(0.0, t_grid, 0.0, hrqol),
		ncol = 2,
		byrow = FALSE,
		dimnames = list(NULL, c("x", "y"))
	)
}
