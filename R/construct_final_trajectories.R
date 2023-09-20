#' Compute final trajectories
#'
#' Cached. Takes a "raw" trajectory object and samples values according to sampling strategy.
#' Assumes the first coordinate in the `traj` object is day of ICU discharge.
#'
#' @inheritParams construct_arm_level_trajectory
#' @param traj tibble, x and y columns correspond to t and HRQoL, resp.
#'
#' @return A three-element list with trajectories for each of the three assumptions as to when
#'   sampling can start.
#'
construct_final_trajectories <- function(traj, t_icu_discharge, sampling_frequency) {
	t_hosp_discharge <- compute_hosp_discharge(t_icu_discharge)
	eof <- traj[nrow(traj), "x"] # end of follow-up

	if (nrow(traj) <= 2 && is.na(traj[2, "y"])) {
		# These patients die before ICU discharge
		return(list(
			primary = na_matrix(t_icu_discharge),
			secondary1 = na_matrix(t_hosp_discharge),
			secondary2 = na_matrix(90)
		))
	}

	out <- list()

	traj_x <- traj[, "x"]
	traj_y <- traj[, "y"]

	out$primary <- if (eof >= t_icu_discharge) {
		x_grid <- create_xout(t_icu_discharge, eof, sampling_frequency)
		matrix(
			c(x_grid, fast_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(t_icu_discharge)
	}

	out$secondary1 <- if (eof >= t_hosp_discharge) {
		x_grid <- create_xout(t_hosp_discharge, eof, sampling_frequency)
		matrix(
			c(x_grid, fast_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(t_hosp_discharge)
	}

	out$secondary2 <- if (eof >= 90) {
		x_grid <- create_xout(90, eof, sampling_frequency)
		matrix(
			c(x_grid, fast_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(90)
	}

	out
}
