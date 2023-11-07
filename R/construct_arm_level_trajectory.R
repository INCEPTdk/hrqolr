#' Construct arm-level trajectory
#'
#' Default arguments correspond to control-arm settings. All patient trajectories, within a given
#' trial, are based on this.
#'
#' @inheritParams simulate_trials
#' @inheritParams setup_scenario
#' @param t_icu_discharge scalar, time of ICU discharge
#' @param acceleration_hrqol scalar in `[0, Inf)`, acceleration of HRQoL improvement compared to baseline
#'   trajectory
#' @param first_hrqol_arm scalar, HRQoL at ICU discharge (at arm level)
#' @param final_hrqol_arm scalar HRQoL at end of follow-up (at arm level)
#'
#' @keywords internal
#' @return A matrix with two columns: x is time and y the corresponding HRQoL values.
#'
construct_arm_level_trajectory <- function(
		t_icu_discharge,
		acceleration_hrqol,
		index_hrqol_arm,
		first_hrqol_arm,
		final_hrqol_arm,
		sampling_frequency = 14L
) {

	hash <- rlang::hash(c(
		"construct_arm_level_trajectory",
		t_icu_discharge,
		acceleration_hrqol,
		index_hrqol_arm,
		first_hrqol_arm,
		final_hrqol_arm,
		sampling_frequency
	))
	out <- .hrqolr_cache_user$get(hash)

	if (!cachem::is.key_missing(out)) {
		return(out)
	}

	# Base trajectory
	t <- c(
		icu_discharge = t_icu_discharge,
		hosp_discharge = compute_hosp_discharge(t_icu_discharge),
		fu_3mo = 90,
		end_of_followup = compute_eof(t_icu_discharge, 180, sampling_frequency)
	)
	hrqol <- c(0.1, 0.3, 0.68, 0.75)
	traj <- create_smooth_trajectory(t, hrqol) # post-ICU discharge trajectory
	for (i in seq(2, length(traj$y))) {
		traj$y[i] <- max(traj$y[i-1], traj$y[i]) # enforce monotonicity
	}

	# Transform trajectory
	dy <- rescale(diff(traj$y))
	y_tmp <- cumsum(c(0.0, dy * (final_hrqol_arm - first_hrqol_arm))) + first_hrqol_arm
	y_tmp <- y_tmp * seq(acceleration_hrqol, 1, length = length(y_tmp))
	traj$y <- pmin(y_tmp, final_hrqol_arm) # avoid overshooting the final HRQoL

	out <- rbind(c(x = 0, y = index_hrqol_arm[[1]]), as.matrix(traj))
		# Concatenate index values (i.e. values at enrolment)
		# Double brackets remove the name of the value (5 x faster than unname())

	if (!is.null(hash)) {
		.hrqolr_cache_user$set(hash, out)
	}

	return(out)
}
