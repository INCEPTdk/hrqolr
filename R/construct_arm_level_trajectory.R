#' Construct arm-level trajectory
#'
#' Default arguments correspond to control-arm settings. All patient trajectories, within a given
#' trial, are based on this.
#'
#' @inheritParams simulate_trials
#' @param t_icu_discharge scalar, time of ICU discharge
#' @param acceleration_hrqol_actv scalar, acceleration of HRQoL improvement in active-arm patients
#' @param start_hrqol_arm scalar, HRQoL at ICU discharge (at arm level)
#' @param final_hrqol_arm scalar HRQoL at end of follow-up (at arm level)
#'
#' @keywords internal
#' @return A matrix with two columns: x is time and y the corresponding HRQoL values.
#'
construct_arm_level_trajectory <- function(
		t_icu_discharge,
		sampling_frequency = 14L,
		acceleration_hrqol = 0.0,
		start_hrqol_arm = 0.1,
		final_hrqol_arm = 0.75
) {

	# Base trajectory
	t <- c(
		icu_discharge = t_icu_discharge,
		hosp_discharge = compute_hosp_discharge(t_icu_discharge),
		fu_3mo = 90,
		end_of_followup = compute_eof(t_icu_discharge, 180, sampling_frequency)
	)
	hrqol <- c(0.1, 0.3, 0.68, 0.75)
	traj <- create_smooth_trajectory(t, hrqol) # post-ICU discharge trajectory

	# Transform trajectory
	dy <- rescale(diff(traj$y))
	y_tmp <- cumsum(c(0.0, dy * (final_hrqol_arm - start_hrqol_arm))) + start_hrqol
	traj$y <- y_tmp * seq(1L + acceleration_hrqol, 1L, length = length(y_tmp))

	rbind(c(x = 0L, y = 0L), as.matrix(traj))
}
