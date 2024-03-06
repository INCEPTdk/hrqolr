#' Helper function to estimate outcomes in individual patients
#'
#' @inheritParams simulate_trials
#' @inheritParams construct_arm_level_trajectory
#' @param n_patients single integer, the number of patients for whom to estimate outcomes
#' @param arm character vector of length 1
#' @param mortality_rng function, a function that produces times of death (only one parameter which should be the number of values to sample)
#'
#' @keywords internal
#' @return data.table with outcome results for all patients. NB! There is no `trial_id` indicator as
#'   this is not required in all uses of this helper function.
#'
estimation_helper <- function(
		n_patients,
		arm,

		index_hrqol_arm,
		first_hrqol_arm,
		final_hrqol_arm,
		inter_patient_noise_sd,
		acceleration_hrqol,

		prop_mortality_benefitters,
		mortality_trajectory_shape,
		mortality_dampening,
		mortality_rng,

		sampling_frequency = NULL,
		n_digits = 2,
		valid_hrqol_range = c(-0.757, 1.0),
		verbose = FALSE
) {

	t_icu_discharge <- sample_t_icu_discharge(n_patients)
	t_death <- mortality_rng(n_patients)

	is_mortality_benefitter <- if (prop_mortality_benefitters > 0) {
		stats::runif(n_patients) < prop_mortality_benefitters
	} else {
		rep(FALSE, n_patients)
	}

	first_hrqol_patients <- round(
		stats::rnorm(
			n_patients,
			first_hrqol_arm * acceleration_hrqol,
			inter_patient_noise_sd
		),
		digits = n_digits
	)

	if (isTRUE(verbose)) log_timediff(NULL, "Building data.table with patients")
	patients <- data.table::data.table(
		t_icu_discharge,
		first_hrqol_patient = pmin(pmax(first_hrqol_patients, valid_hrqol_range[1]), valid_hrqol_range[2]),
		t_death,
		is_mortality_benefitter
	)

	if (isTRUE(verbose)) log_timediff(NULL, "Finding unique patients")
	unique_patient_types <- patients[, .(n = .N), by = names(patients)]

	if (isTRUE(verbose)) {
		log_timediff(NULL, sprintf("Estimating for %i unique patients", nrow(unique_patient_types)))
	}

	tmp <- with(
		unique_patient_types,
		mapply(
			function(arg1, arg2, arg3, arg4) {
				compute_estimates(
					t_icu_discharge = arg1,
					t_death = arg3,
					first_hrqol_patient = arg2,
					is_mortality_benefitter = arg4,

					acceleration_hrqol = acceleration_hrqol,
					index_hrqol_arm = index_hrqol_arm,
					first_hrqol_arm = first_hrqol_arm,
					final_hrqol_arm = final_hrqol_arm,
					mortality_trajectory_shape = mortality_trajectory_shape,
					mortality_dampening = mortality_dampening,

					sampling_frequency = sampling_frequency,
					valid_hrqol_range = valid_hrqol_range
				)
			},
			t_icu_discharge,
			first_hrqol_patient,
			t_death,
			is_mortality_benefitter,
			SIMPLIFY = FALSE
		)
	)

	if (isTRUE(verbose)) log_timediff(NULL, "Assigning results to all (non-unique) patients")
	res_unique <- data.table::as.data.table(do.call(rbind, tmp))
	res_unique[rep(1:.N, unique_patient_types$n)] # "un-count" and return in one go
}
