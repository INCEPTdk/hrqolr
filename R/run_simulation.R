#' Title
#'
#' @param n_patients_per_arm int
#' @param n_trials_per_scenario int
#' @param start_hrqol_ctrl double
#' @param final_hrqol_ctrl double
#' @param relative_improvement_hrqol_actv doublne
#' @param sampling_frequency int
#' @param acceleration_hrqol_actv
#' @param mortality_ctrl
#' @param relative_mortality_actv
#' @param mortality_dampening
#' @param mortality_trajectory
#' @param prop_mortality_benefitters_actv
#' @param seed
#'
#' @return
#' @export
#'
run_simulation <- function(
		n_patients_per_arm = 5L,
		n_trials_per_scenario = 10L,

		start_hrqol_ctrl = 0.1,
		final_hrqol_ctrl = 0.75,
		relative_improvement_hrqol_actv = 0.1,
		sampling_frequency = 14L,
		acceleration_hrqol_actv = 0.1,

		mortality_ctrl = 0.3,
		relative_mortality_actv = 0.95,
		mortality_dampening = 0.7,
		mortality_trajectory = "exp_decay",
		prop_mortality_benefitters_actv = 0.1,

		n_digits = 2,
		seed = 4131
) {

	set.seed(seed)

	mortality_funs <- list(
		ctrl = generate_mortality_funs(mortality_ctrl),
		actv = generate_mortality_funs(mortality_ctrl * relative_mortality_actv)
	)

	trials <- list()

	ticks <- .POSIXct(double(n_trials_per_scenario) + 1)
	ticks[1] <- Sys.time()

	warnings(
		"Maybe we could
		- pre-compute unique combinations of patient-level parameters for all n_trials_per_simulation * sum(n_patients_per_trial)
		- once, for each unique combination, compute the estimands
		- repeat the estimand values for the number of patients with that value
		- proceed to compute statistics for each trial
		"
	)

	for (i in seq_len(n_trials_per_scenario)) {
		# message("Trial ", i)
		for (arm in c("ctrl", "actv")) {
			# cat("> Arm:", arm, "| ")
			relative_improvement_hrqol <- 1.0 + relative_improvement_hrqol_actv * (arm == "actv")
			start_hrqol_arm <- round(start_hrqol_ctrl * relative_improvement_hrqol, n_digits)
			final_hrqol_arm <- round(final_hrqol_ctrl * relative_improvement_hrqol, n_digits)

			inter_patient_noise_sd <- start_hrqol_ctrl * relative_improvement_hrqol / 1.96

			# Pre-computing calculation to exploit vectorisation to the greatest
			# possible extent

			start_hrqol_patients <- round(
				rnorm(n_patients_per_arm, start_hrqol_arm, inter_patient_noise_sd),
				digits = n_digits
			)
			start_hrqol_patients <- pmin(pmax(start_hrqol_patients, -0.757), 1.0)
				# restrict to valid EQ-5D-5L index values (in Danish population)

			t_deaths <- mortality_funs[[arm]]$r(n_patients_per_arm)

			for (pt_idx in seq_len(n_patients_per_arm)) {
				# cat("+")
				est <- compute_estimates(
					sampling_frequency = sampling_frequency,
					acceleration_hrqol = (arm == "actv") * acceleration_hrqol_actv,
					start_hrqol_arm = start_hrqol_arm,
					final_hrqol_arm = final_hrqol_arm,
					start_hrqol_patient = start_hrqol_patients[pt_idx],

					t_death = t_deaths[pt_idx],
					is_mortality_benefitter = (arm == "actv") & (runif(1) < prop_mortality_benefitters_actv),
					mortality_trajectory = mortality_trajectory,
					mortality_dampening = mortality_dampening,

					n_digits = n_digits
				)
			}
			ticks[i+1] <- Sys.time()
			# cat("\n")
		}
	}

	ticks
	# tibble::as_tibble(dplyr::bind_rows(patients, .id = "patient_id"))
}
