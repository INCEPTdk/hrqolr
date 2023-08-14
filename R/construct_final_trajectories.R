#' Compute final trajectories
#'
#' Cached. Takes a "raw" trajectory object and samples values according to
#' sampling strategy. Assumes the first coordinate in the `traj` object is day
#' of ICU discharge.
#'
#' @param traj tibble, x and y columns correspond to t and HRQoL, resp.
#' @param t_icu_discharge int, day of ICU discharge
#' @param sampling_frequency int
#'
#' @return
#' @export
#'
#' @examples
#'
construct_final_trajectories <- function(traj, t_icu_discharge, sampling_frequency) {

	t_hosp_discharge <- compute_hosp_discharge(t_icu_discharge)
	eof <- traj$x[nrow(traj)] # end of follow-up

	if (nrow(traj) == 1) {
		# These are patients who die before ICU discharge
		out <- list(
			primary = c(x = t_icu_discharge, y = NA),
			secondary1 = c(x = t_hosp_discharge, y = NA),
			secondary2 = c(x = 90, y = NA)
		)
		return(purrr::map(out, ~ dplyr::bind_rows(c(x = 0.0, y = 0.0), .)))
	}

	out <- list()

	# Enforcing unique values in xout vectors below as the penultimate and last
	# values might be identical

	out$primary <- if (eof >= t_icu_discharge) {
		tibble::as_tibble(approx(
			traj$x,
			traj$y,
			xout = unique(c(seq(t_icu_discharge, eof, by = sampling_frequency), eof))
		))
	} else {
		c(x = t_icu_discharge, y = NA)
	}

	out$secondary1 <- if (eof >= t_hosp_discharge) {
	 	tibble::as_tibble(approx(
			traj$x,
			traj$y,
			xout = unique(c(seq(t_hosp_discharge, eof, by = sampling_frequency), eof))
		))
	} else {
		c(x = t_hosp_discharge, y = NA)
	}

	out$secondary2 <- if (eof >= 90) {
		tibble::as_tibble(approx(
			traj$x,
			traj$y,
			xout = unique(c(seq(90, eof, by = sampling_frequency), eof))
		))
	} else {
		c(x = 90, y = NA)
	}

	# Add HRQoL = 0.0 at index (the same for every patient) to all trajectories
	purrr::map(out, ~ dplyr::bind_rows(c(x = 0.0, y = 0.0), .))
}
