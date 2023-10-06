# Setup scenario handles single-value arguments

    Code
      setup_scenario(arms = c("Active", "Control"), n_patients_per_arm = 500,
      index_hrqol = 0, first_hrqol = 0, final_hrqol = 0, acceleration_hrqol = 0,
      mortality = 0.2, mortality_dampening = 0, mortality_trajectory_shape = "exp_decay",
      prop_mortality_benefitters = 0.1, sampling_frequency = 14)
    Output
      arms                         valid as is      
      n_patients_per_arm           modified      500 --> c("Active" = 500, "Control" = 500)   
      index_hrqol                  modified      0 --> c("Active" = 0, "Control" = 0)   
      first_hrqol                  modified      0 --> c("Active" = 0, "Control" = 0)   
      final_hrqol                  modified      0 --> c("Active" = 0, "Control" = 0)   
      acceleration_hrqol           modified      0 --> c("Active" = 0, "Control" = 0)   
      mortality                    modified      0.2 --> c("Active" = 0.2, "Control" = 0.2)   
      mortality_dampening          modified      0 --> c("Active" = 0, "Control" = 0)   
      mortality_trajectory_shape   modified      "exp_decay" --> c("Active" = "exp_decay", "Control" = "exp_decay")   
      prop_mortality_benefitters   modified      0.1 --> c("Active" = 0.1, "Control" = 0.1)   
      sampling_frequency           modified      14 --> c("Active" = 14, "Control" = 14)   
      arms                               Active     Control
      n_patients_per_arm                    500         500
      index_hrqol                             0           0
      first_hrqol                             0           0
      final_hrqol                             0           0
      acceleration_hrqol                      0           0
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14

