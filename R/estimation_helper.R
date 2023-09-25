#' Helper function to estimate outcomes in individual patients
#'
#' @inheritParams simulate_trials
#' @inheritParams construct_arm_level_trajectory
#' @param n_patients int, the number of patients for whom to estimate outcomes
#' @param arm string, either `"actv"` or `"ctrl"`
#' @param acceleration_hrqol scalar, acceleration of HRQoL improvement
#' @param mortality_rng function, a function that produces times of death (only one parameter which should be the number of values to sample)
#' @param min_valid_hrqol scalar, the minimum valid HRQoL value
#'
#' @keywords internal
#' @return Data.table with outcome results for all patients. NB! There are no trial_id indicator as
#'   this is not required in all uses of this helper function.
#'
estimation_helper <- function(
		n_patients,
		arm,
		prop_mortality_benefitters_actv,
		start_hrqol_arm,
		inter_patient_noise_sd,
		acceleration_hrqol,
		mortality_trajectory_shape,
		mortality_dampening,
		mortality_rng,
		n_digits = 2,
		min_valid_hrqol = -0.757
) {

	t_icu_discharge <- sample_t_icu_discharge(n_patients)
	t_death <- mortality_rng(n_patients)
	is_mortality_benefitter <- (arm == "actv") &
		(stats::runif(n_patients) < prop_mortality_benefitters_actv)
	start_hrqol_patients <- round(
		stats::rnorm(n_patients, start_hrqol_arm, inter_patient_noise_sd),
		digits = n_digits
	)

	patients <- data.table::data.table(
		t_icu_discharge,
		start_hrqol_patient = pmin(pmax(start_hrqol_patients, min_valid_hrqol), 1L),
		t_death,
		is_mortality_benefitter
	)

	unique_patient_types <- patients[, .(n = .N), by = names(patients)]

	tmp <- with(
		unique_patient_types,
		mapply(
			function(arg1, arg2, arg3, arg4) {
				compute_estimates(
					t_icu_discharge = arg1,
					start_hrqol_patient = arg2,
					t_death = arg3,
					is_mortality_benefitter = arg4,
					acceleration_hrqol = acceleration_hrqol,
					mortality_trajectory_shape = mortality_trajectory_shape,
					mortality_dampening = mortality_dampening
				)
			},
			t_icu_discharge,
			start_hrqol_patient,
			t_death,
			is_mortality_benefitter,
			SIMPLIFY = FALSE
		)
	)

	res <- data.table::as.data.table(do.call(rbind, tmp))
	res[, n_patients_with_type := unique_patient_types$n]
	res <- res[rep(1:.N, n_patients_with_type)] # "un-count"
	res[, n_patients_with_type := NULL]

	res
}
