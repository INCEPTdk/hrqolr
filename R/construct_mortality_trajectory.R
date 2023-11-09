#' Construct mortality trajectory for a patient
#'
#' If a patient dies in the follow-up period, they will follow the HRQoL trajectory produced by this
#' function.
#'
#' @inheritParams construct_arm_level_trajectory
#' @inheritParams simulate_trials
#' @param t_death numeric scalar, time of death. NA represent administrative censoring (i.e., the
#'   patient was still alive at end of follow-up)
#' @param index_hrqol single numeric value, HRQoL at index (= time of enrolment)
#' @param first_hrqol single numeric value, HRQoL at ICU discharge
#' @param resolution single integer, the number of grid points on the HRQoL trajectory between ICU discharge
#'   and time of death
##' @param n_halflives_to_zero single numeric value, the number of half-lives after which one considers HRQoL to
##'  equal `0`.
#'
#' @return Two-column matrix: `x` is time, `y` is the HRQoL.
#' @keywords internal
#'
construct_mortality_trajectory <- function(
		t_death,
		t_icu_discharge,
		index_hrqol,
		first_hrqol,
		mortality_trajectory_shape,
		resolution = 100,
		n_halflives_to_zero = 10
) {

	if (mortality_trajectory_shape == "linear") {
		t_grid <- c(t_icu_discharge, t_death)
		hrqol <- c(first_hrqol, 0.0)
	} else if (mortality_trajectory_shape == "constant") {
		t_grid <- c(t_icu_discharge, t_death)
		hrqol <- c(first_hrqol, first_hrqol)
	} else {
		t_grid <- seq(t_icu_discharge, t_death, length = resolution)
		t_half <- (t_death - t_icu_discharge) / n_halflives_to_zero
		t_diff <- t_grid - t_icu_discharge
		hrqol <- first_hrqol * 2.0^(-t_diff / t_half)
		hrqol[length(hrqol)] <- 0.0 # enforce HRQoL at day of death

		if (mortality_trajectory_shape == "reflected_exp_decay") {
			# Essentially rotates the trajectory 180 degrees
			hrqol <- first_hrqol - hrqol
			t_grid <- rev(t_grid)
		}
	}

	matrix(
		c(0.0, t_grid, index_hrqol, hrqol),
		ncol = 2,
		byrow = FALSE,
		dimnames = list(NULL, c("x", "y"))
	)
}
