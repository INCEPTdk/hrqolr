# Setup scenario handles single-value arguments

    Code
      setup_scenario(arms = c("Active", "Control"), n_patients = 500, index_hrqol = 0,
      first_hrqol = 0, final_hrqol = 0, acceleration_hrqol = 1, mortality = 0.2,
      mortality_dampening = 0, mortality_trajectory_shape = "exp_decay",
      prop_mortality_benefitters = 0.1, sampling_frequency = 14, verbose = FALSE)
    Output
      - arms                               Active     Control
      - n_patients                            500         500
      - index_hrqol                             0           0
      - first_hrqol                             0           0
      - final_hrqol                             0           0
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters            0.1         0.1
      - sampling_frequency                     14          14

