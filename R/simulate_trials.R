#' Title
#'
#' @inheritParams DBI::dbWriteTable
#' @param db_append logical, should simulation engine append new results to old ones? Default is to start over
#' @param n_patients_per_arm int vector, if more than one trial sample size is
#'   simulated, use a vector to tell that the run_simulations
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
#' @return A string indicating where results were saved (if to a database) or a data.table (otherwise)
#' @export
#'
#' @import data.table
#'
simulate_trials <- function(
		conn = NULL,
		db_append = FALSE,

		n_patients_per_arm = 100L,
		n_trials_per_scenario = 100000L,

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
		seed = NULL,
		n_trials_per_batch = NULL
) {

	set.seed(seed %||% digest::digest2int(paste(match.call(), collapse = ", ")))

	MIN_EQ5D5L_DK <- -0.757 # lowest possible EQ-5D-5L index value in Denmark
	DB_TABLE_NAME <- "results"

	mortality_funs <- list(
		ctrl = generate_mortality_funs(mortality_ctrl),
		actv = generate_mortality_funs(mortality_ctrl * relative_mortality_actv)
	)

	ticks <- .POSIXct(double(n_trials_per_scenario) + 1)
	ticks[1] <- Sys.time()

	n_trials_per_batch <- n_trials_per_batch %||% n_trials_per_scenario
	res <- list()

	if (isFALSE(db_append)) {
		try(
			DBI::dbExecute(conn, sprintf("DELETE FROM %s", DB_TABLE_NAME)),
			silent = TRUE
		)
	}

	trial_results <- list()
	n_batches <- ceiling(n_patients_per_arm * n_trials_per_scenario / n_trials_per_batch)
	message("No. batches: ", n_batches)

	n_patients <- min(n_patients_per_arm * n_trials_per_scenario, n_trials_per_batch)

	for (arm in c("actv", "ctrl")) {
		acceleration_hrqol <- acceleration_hrqol_actv * (arm == "actv")

		for (batch in seq_len(n_batches)) {
			relative_improvement_hrqol <- 1L + relative_improvement_hrqol_actv * (arm == "actv")
			start_hrqol_arm <- round(start_hrqol_ctrl * relative_improvement_hrqol, n_digits)
			final_hrqol_arm <- round(final_hrqol_ctrl * relative_improvement_hrqol, n_digits)

			inter_patient_noise_sd <- start_hrqol_ctrl * relative_improvement_hrqol / 1.96
			start_hrqol_patients <- round(
				rnorm(n_patients, start_hrqol_arm, inter_patient_noise_sd),
				digits = n_digits
			)

			t_icu_discharge <- ceiling(rlnorm(
				n = n_patients,
				meanlog = log(5),
				sdlog = log(2) * 1.4826
			))
			t_death <- mortality_funs[[arm]]$r(n_patients)
			is_mortality_benefitter <- (arm == "actv") &
				(runif(n_patients) < prop_mortality_benefitters_actv)

			start_time <- Sys.time()
			patients <- data.table::data.table(
				t_icu_discharge,
				start_hrqol_patient = pmin(pmax(start_hrqol_patients, MIN_EQ5D5L_DK), 1L),
				t_death,
				is_mortality_benefitter
			)

			unique_patient_types <- patients[, .(n = .N), by = names(patients)]

			log_timediff(start_time)
			message(sprintf(
				"%i (%.1f%%) unique patient types of %i patients in batch",
				nrow(unique_patient_types),
				100 * nrow(unique_patient_types)/nrow(patients),
				nrow(patients)
			))

			apply_helper <- function(t_icu_discharge, start_hrqol_patient, t_death, is_mortality_benefitter) {
				compute_estimates(
					t_icu_discharge = t_icu_discharge,
					start_hrqol_patient = start_hrqol_patient,
					t_death = t_death,
					is_mortality_benefitter = is_mortality_benefitter,
					acceleration_hrqol = acceleration_hrqol
				)
			}

			tmp <- with(
				unique_patient_types,
				mapply(
					apply_helper,
					t_icu_discharge,
					start_hrqol_patient,
					t_death,
					is_mortality_benefitter,
					SIMPLIFY = FALSE
				)
			)
			log_timediff(start_time)

			# Assign trial id's, keeping track of how many have been assigned in other batches
			# to enforce same trial sizes across the board
			if (batch == 1) {
				trial_id_weights <- data.table::data.table(
					trial_id = seq_len(n_trials_per_scenario),
					start_weight = n_patients_per_arm,
					updated_weight = n_patients_per_arm
				)
			} else {
				trial_id_weights <- merge(
					trial_id_weights,
					trial_results[[arm]][, .(n_used = .N), by = "trial_id"],
					by = "trial_id",
					all = TRUE
				)

				trial_id_weights[, `:=`(
					updated_weight = start_weight - ifelse(is.na(n_used), 0, n_used),
					n_used = NULL
				)]
			}

			trial_ids <- sample(
				x = rep(trial_id_weights$trial_id, trial_id_weights$updated_weight),
				size = n_patients,
			)

			batch_result <- data.table::as.data.table(do.call(rbind, tmp))
			batch_result[, n_patients_with_type := unique_patient_types$n]
			batch_result <- batch_result[rep(1:.N, n_patients_with_type)] # "un-count"
			batch_result[, `:=`(trial_id = trial_ids, n_patients_with_type = NULL)]

			if (is.null(conn)) {
				trial_results[[arm]] <- rbind(trial_results[[arm]], batch_result)
			} else {
				DBI::dbWriteTable(
					conn = conn,
					name = DB_TABLE_NAME,
					value = batch_result,
					append = TRUE
				)
			}

			log_timediff(start_time)
		}
	}

	final_result <- data.table::rbindlist(trial_results, idcol = "arm")

	if (is.null(conn)) {
		final_result
	} else {
		DBI::dbExecute(conn, sprintf("CREATE INDEX on %s (trial_id);", DB_TABLE_NAME))
		sprintf("results saved to table '%s' in database '%s'", DB_TABLE_NAME, conn@dbname)
	}
}
