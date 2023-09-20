library(targets)
library(tarchetypes)
library(tidyr)

scenarios <- expand_grid(
	n_patients_per_arm = c(100L, 500L, 1000L, 2000L),
	relative_mortality_reduction_actv = c(0.0, 0.025, 0.05, 0.10),
	acceleration_hrqol_actv = c(0.0, 0.1),
	relative_improvement_hrqol_actv = 0.0,
	mortality_dampening = c(0.0, 0.2),
	prop_mortality_benefitters_actv = c(0.0, 0.05, 0.1, 0.15),
	mortality_trajectory = "exp_decay",

	# Constants
	n_trials = 2000,
	start_hrqol_ctrl = 0.10,
	final_hrqol_ctrl = 0.75,
	mortality_ctrl = 0.4,
	sampling_frequency = 14L
)

controller <- crew::crew_controller_local(
	name = "hrqolr_controller",
	workers = 7,
	seconds_idle = 5
)
tar_option_set(controller = controller)

parallel_simulations <- tar_map(
	scenarios,
	unlist = FALSE,
	tar_target(
		simulation,
		hrqolr::simulate_trials(
			n_patients_per_arm = n_patients_per_arm,
			relative_mortality_reduction_actv = relative_mortality_reduction_actv,
			acceleration_hrqol_actv = acceleration_hrqol_actv,
			relative_improvement_hrqol_actv = relative_improvement_hrqol_actv,
			mortality_dampening = mortality_dampening,
			prop_mortality_benefitters_actv = prop_mortality_benefitters_actv,
			mortality_trajectory = mortality_trajectory,

			# Constants
			n_trials = n_trials,
			start_hrqol_ctrl = start_hrqol_ctrl,
			final_hrqol_ctrl = final_hrqol_ctrl,
			mortality_ctrl = mortality_ctrl,
			sampling_frequency = sampling_frequency
		),
		format = "rds",
		repository = "local"
	)
)

figure1 <- tar_combine(
	figure1_target,
	parallel_simulations[["simulation"]],
	command = list(!!!.x)
)

list(
	parallel_simulations,
	figure1
)
