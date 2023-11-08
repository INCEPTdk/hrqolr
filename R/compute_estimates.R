#' Compute outcome estimates for a given patient
#'
#' @inheritParams construct_patient_trajectory
#' @inheritParams construct_final_trajectories
#'
#' @keywords internal
#' @return A six-element named numeric vector with single-sampled HRQoL at end of follow-up and area
#'   under the HRQoL trajectory for the primary and the two secondary analyses.
#'
compute_estimates <- function(
		# Specific to this patient
		t_icu_discharge,
		t_death,
		first_hrqol_patient,
		is_mortality_benefitter,

		# Scenario settings
		acceleration_hrqol,
		index_hrqol_arm,
		first_hrqol_arm,
		final_hrqol_arm,
		mortality_trajectory_shape,
		mortality_dampening,

		# Constant across patients
		sampling_frequency
) {

	mc <- match.call()
	hash <- rlang::hash(c( ### AG: Don't we need to check if package available here? rlang is in suggests
		deparse(mc[1]),
		lapply(mc[-1], eval, parent.frame())
	))
	res <- .hrqolr_cache_user$get(hash)

	if (!cachem::is.key_missing(res)) {
		return(res)
	}

	patient_trajs <- construct_patient_trajectory(
		t_icu_discharge = t_icu_discharge,
		t_death = t_death,
		first_hrqol_patient = first_hrqol_patient,

		acceleration_hrqol = acceleration_hrqol,
		index_hrqol_arm = index_hrqol_arm,
		first_hrqol_arm = first_hrqol_arm,
		final_hrqol_arm = final_hrqol_arm,
		is_mortality_benefitter = is_mortality_benefitter,
		mortality_trajectory_shape = mortality_trajectory_shape,
		mortality_dampening = mortality_dampening,

		sampling_frequency = sampling_frequency
	)

	res <- numeric(6)
	names(res) <- paste(
		rep(names(patient_trajs), each = 2),
		rep(c("hrqol_at_eof", "hrqol_auc"), 3),
		sep = "__"
	)

	for (i in seq_along(patient_trajs)) {
		this_traj <- patient_trajs[[i]]
		res[2 * i - 1] <- this_traj[nrow(this_traj), "y"]
		res[2 * i] <- auc(this_traj[, "x"], this_traj[, "y"])
	}

	if (!is.null(hash)) {
		.hrqolr_cache_user$set(hash, res)
	}

	res
}
