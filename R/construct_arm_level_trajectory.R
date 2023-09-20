
#' Title
#'
#' Uses dynamic caching (powered by memoise package) for increased performance. Default setting correspond to control-arm settings.
#'
#' @param t_icu_discharge scalar, time of ICU discharge
#' @param mortality_dampening scalar, dampening effect of HRQoL at ICU discharge in patients who die before end of follow-up
#' @param sampling_frequency int, for span between samplings from patients
#' @param acceleration_hrqol_actv scalar,
#' @param start_hrqol scalar, HRQoL at ICU discharge
#' @param min_hrqol sclar HRQoL at end of follow-up
#'
#' @return A matrix with two columns: x is time and y the corresponding HRQoL values.
#' @keywords internal
#'
construct_arm_level_trajectory <- function(
		t_icu_discharge,
		sampling_frequency = 14L,
		acceleration_hrqol = 0.0,
		start_hrqol = 0.1,
		final_hrqol = 0.75
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
	y_tmp <- cumsum(c(0.0, dy * (final_hrqol - start_hrqol))) + start_hrqol
	traj$y <- y_tmp * seq(1L + acceleration_hrqol, 1L, length = length(y_tmp))

	rbind(c(x = 0L, y = 0L), as.matrix(traj))
}
