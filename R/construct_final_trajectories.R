#' Compute final trajectories
#'
#' Cached. Takes a "raw" trajectory object and samples values according to sampling strategy.
#' Assumes the first coordinate in the `traj` object is day of ICU discharge.
#'
#' @inheritParams construct_arm_level_trajectory
#' @param traj matrix, x = time and y = HRQoL
#'
#' @return A three-element list with trajectories for each of the three assumptions as to when
#'   sampling can start.
#'
construct_final_trajectories <- function(traj, t_icu_discharge, sampling_frequency) {
	mc <- match.call()
	hash <- rlang::hash(c(
		deparse(mc[1]),
		lapply(mc[-1], eval, parent.frame())
	))
	res <- .hrqolr_cache_user$get(hash)

	if (!cachem::is.key_missing(res)) {
		return(res)
	}

	t_hosp_discharge <- compute_hosp_discharge(t_icu_discharge)
	eof <- traj[nrow(traj), "x"] # end of follow-up
	index_hrqol <- traj[1, "y"]

	if (nrow(traj) <= 2 && is.na(traj[2, "y"])) {
		# These patients die before ICU discharge
		res <- list(
			primary = na_matrix(index_hrqol, t_icu_discharge),
			secondary1 = na_matrix(index_hrqol, t_hosp_discharge),
			secondary2 = na_matrix(index_hrqol, 90)
		)

		if (!is.null(hash)) {
			.hrqolr_cache_user$set(hash, res)
		}

		return(res)
	}

	res <- vector("list", 3)
	names(res) <- c("primary", "secondary1", "secondary2")

	traj_x <- traj[, "x"]
	traj_y <- traj[, "y"]

	res$primary <- if (eof >= t_icu_discharge) {
		x_grid <- create_xout(t_icu_discharge, eof, sampling_frequency)
		matrix(
			c(x_grid, hrqolr_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(index_hrqol, t_icu_discharge)
	}

	res$secondary1 <- if (eof >= t_hosp_discharge) {
		x_grid <- create_xout(t_hosp_discharge, eof, sampling_frequency)
		matrix(
			c(x_grid, hrqolr_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(index_hrqol, t_hosp_discharge)
	}

	res$secondary2 <- if (eof >= 90) {
		x_grid <- create_xout(90, eof, sampling_frequency)
		matrix(
			c(x_grid, hrqolr_approx(traj_x, traj_y, x_grid)),
			ncol = 2,
			byrow = FALSE,
			dimnames = list(NULL, c("x", "y"))
		)
	} else {
		na_matrix(index_hrqol, 90)
	}

	if (!is.null(hash)) {
		.hrqolr_cache_user$set(hash, res)
	}

	return(res)
}
