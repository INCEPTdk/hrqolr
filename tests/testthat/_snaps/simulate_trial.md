# simulate_trial S3 method works

    Code
      sims_single_batch
    Output
      # Scenario specification
      - arms                               Active     Control
      - n_patients                             50          50
      - index_hrqol                             0           0
      - first_hrqol                           0.2         0.2
      - final_hrqol                           0.7         0.5
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters            0.1         0.1
      - sampling_frequency                     14          14
      
      # Simulation metadata
      - No. simulated trials          100   
      - Max. no. patients per batch   NULL   
      - No. ground-truth samples      10   
      - Valid range of HRQoL          [-0.757,  1.000]   
      - Significance level (alpha)    0.05   
      - Test function                 Unknown name   
      - Seed                          42   
      - Elapsed time                  0.0 secs   
      - Peak memory use               0 B   
      
      # Comparisons between arms (all patients) and select performance metrics
                                primary__hrqol_at_eof primary__hrqol_auc
                         <char>                <char>             <char>
                 Comparator arm                Active             Active
                     Target arm               Control            Control
                Mean difference                -0.155            -21.447
       Std. error of mean diff.                 0.005              0.758
                  Relative bias                 0.003              0.225
           Rejection proportion                  0.84               0.76
                       Coverage                  0.96               0.95
      
      # Summary statistics
      ## All participants
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.522  0.557  0.584  0.554 0.042 0.004
          primary__hrqol_at_eof Control  0.379  0.400  0.419  0.398 0.033 0.003
             primary__hrqol_auc  Active 78.698 83.636 88.164 83.488 6.520 0.652
             primary__hrqol_auc Control 58.955 62.349 64.542 62.041 5.151 0.515
       secondary1__hrqol_at_eof  Active  0.522  0.557  0.584  0.554 0.042 0.004
       secondary1__hrqol_at_eof Control  0.379  0.400  0.419  0.399 0.033 0.003
          secondary1__hrqol_auc  Active 77.565 82.682 86.926 82.445 6.421 0.642
          secondary1__hrqol_auc Control 57.653 61.181 63.240 60.790 5.076 0.508
       secondary2__hrqol_at_eof  Active  0.522  0.557  0.584  0.554 0.042 0.004
       secondary2__hrqol_at_eof Control  0.379  0.400  0.419  0.399 0.033 0.003
          secondary2__hrqol_auc  Active 70.875 75.601 79.573 75.290 5.707 0.571
          secondary2__hrqol_auc Control 51.643 54.642 57.128 54.479 4.494 0.449
      
      ## Survivors
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.586  0.604  0.626  0.606 0.034 0.003
          primary__hrqol_at_eof Control  0.419  0.435  0.456  0.436 0.026 0.003
             primary__hrqol_auc  Active 87.783 91.138 95.122 91.282 5.445 0.545
             primary__hrqol_auc Control 65.327 67.608 70.816 67.896 4.102 0.410
       secondary1__hrqol_at_eof  Active  0.633  0.653  0.669  0.650 0.029 0.003
       secondary1__hrqol_at_eof Control  0.453  0.471  0.483  0.468 0.025 0.002
          secondary1__hrqol_auc  Active 94.157 97.072 99.154 96.735 4.516 0.452
          secondary1__hrqol_auc Control 68.697 71.718 73.680 71.371 3.875 0.388
       secondary2__hrqol_at_eof  Active  0.669  0.683  0.698  0.683 0.022 0.002
       secondary2__hrqol_at_eof Control  0.478  0.488  0.503  0.490 0.019 0.002
          secondary2__hrqol_auc  Active 90.900 92.661 94.861 92.817 3.126 0.313
          secondary2__hrqol_auc Control 65.220 66.714 68.847 66.922 2.615 0.262

---

    Code
      sims_two_batches_verbose
    Output
      # Scenario specification
      - arms                               Active     Control
      - n_patients                             50          50
      - index_hrqol                             0           0
      - first_hrqol                           0.2         0.2
      - final_hrqol                           0.7         0.5
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters            0.1         0.1
      - sampling_frequency                     14          14
      
      # Simulation metadata
      - No. simulated trials          500   
      - Max. no. patients per batch   500   
      - No. ground-truth samples      1,000   
      - Valid range of HRQoL          [-0.757,  1.000]   
      - Significance level (alpha)    0.05   
      - Test function                 Unknown name   
      - Seed                          42   
      - Elapsed time                  0.0 secs   
      - Peak memory use               0 B   
      
      # Comparisons between arms (all patients) and select performance metrics
                                primary__hrqol_at_eof primary__hrqol_auc
                         <char>                <char>             <char>
                 Comparator arm                Active             Active
                     Target arm               Control            Control
                Mean difference                -0.161            -22.135
       Std. error of mean diff.                 0.002              0.363
                  Relative bias                 0.018              0.007
           Rejection proportion                 0.836              0.762
                       Coverage                  0.94              0.944
      
      # Summary statistics
      ## All participants
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.532  0.565  0.593  0.562 0.042 0.002
          primary__hrqol_at_eof Control  0.379  0.403  0.423  0.401 0.033 0.001
             primary__hrqol_auc  Active 80.010 85.079 89.148 84.639 6.331 0.283
             primary__hrqol_auc Control 59.071 62.770 66.006 62.504 5.223 0.234
       secondary1__hrqol_at_eof  Active  0.532  0.565  0.593  0.563 0.042 0.002
       secondary1__hrqol_at_eof Control  0.379  0.403  0.423  0.401 0.033 0.001
          secondary1__hrqol_auc  Active 79.069 84.073 88.109 83.617 6.276 0.281
          secondary1__hrqol_auc Control 57.834 61.503 64.742 61.247 5.141 0.230
       secondary2__hrqol_at_eof  Active  0.532  0.565  0.593  0.563 0.042 0.002
       secondary2__hrqol_at_eof Control  0.379  0.403  0.423  0.401 0.033 0.001
          secondary2__hrqol_auc  Active 72.241 76.826 80.531 76.427 5.684 0.254
          secondary2__hrqol_auc Control 51.735 55.086 57.886 54.901 4.527 0.202
      
      ## Survivors
                        outcome     arm    p25    p50     p75   mean    sd    se
                         <char>  <char>  <num>  <num>   <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.593  0.617   0.640  0.615 0.036 0.002
          primary__hrqol_at_eof Control  0.420  0.440   0.457  0.438 0.029 0.001
             primary__hrqol_auc  Active 89.342 92.815  96.077 92.546 5.470 0.245
             primary__hrqol_auc Control 65.409 68.481  71.248 68.246 4.688 0.210
       secondary1__hrqol_at_eof  Active  0.635  0.658   0.675  0.655 0.031 0.001
       secondary1__hrqol_at_eof Control  0.451  0.468   0.485  0.468 0.025 0.001
          secondary1__hrqol_auc  Active 94.397 97.676 100.443 97.353 4.759 0.213
          secondary1__hrqol_auc Control 68.600 71.460  74.148 71.346 3.970 0.178
       secondary2__hrqol_at_eof  Active  0.669  0.686   0.701  0.685 0.023 0.001
       secondary2__hrqol_at_eof Control  0.479  0.490   0.503  0.490 0.020 0.001
          secondary2__hrqol_auc  Active 90.874 93.217  95.236 93.007 3.243 0.145
          secondary2__hrqol_auc Control 65.410 67.063  68.824 67.029 2.743 0.123

---

    Code
      sims_single_batch_without_examples
    Output
      # Scenario specification
      - arms                               Active     Control
      - n_patients                             50          50
      - index_hrqol                             0           0
      - first_hrqol                           0.2         0.2
      - final_hrqol                           0.7         0.5
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters            0.1         0.1
      - sampling_frequency                     14          14
      
      # Simulation metadata
      - No. simulated trials          100   
      - Max. no. patients per batch   NULL   
      - No. ground-truth samples      1,000   
      - Valid range of HRQoL          [-0.757,  1.000]   
      - Significance level (alpha)    0.05   
      - Test function                 Unknown name   
      - Seed                          42   
      - Elapsed time                  0.0 secs   
      - Peak memory use               0 B   
      
      # Comparisons between arms (all patients) and select performance metrics
                                primary__hrqol_at_eof primary__hrqol_auc
                         <char>                <char>             <char>
                 Comparator arm                Active             Active
                     Target arm               Control            Control
                Mean difference                -0.155            -21.264
       Std. error of mean diff.                 0.006              0.875
                  Relative bias                 0.037              0.018
           Rejection proportion                  0.82                0.7
                       Coverage                   0.9               0.91
      
      # Summary statistics
      ## All participants
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.529  0.559  0.588  0.556 0.046 0.005
          primary__hrqol_at_eof Control  0.377  0.400  0.422  0.402 0.035 0.003
             primary__hrqol_auc  Active 78.722 83.768 88.480 83.752 6.969 0.697
             primary__hrqol_auc Control 58.859 62.414 65.879 62.488 5.345 0.535
       secondary1__hrqol_at_eof  Active  0.529  0.559  0.588  0.556 0.046 0.005
       secondary1__hrqol_at_eof Control  0.377  0.400  0.422  0.402 0.034 0.003
          secondary1__hrqol_auc  Active 77.618 82.844 87.355 82.721 6.887 0.689
          secondary1__hrqol_auc Control 57.724 61.241 64.651 61.258 5.276 0.528
       secondary2__hrqol_at_eof  Active  0.529  0.559  0.588  0.556 0.046 0.005
       secondary2__hrqol_at_eof Control  0.377  0.400  0.422  0.402 0.034 0.003
          secondary2__hrqol_auc  Active 71.494 75.763 79.967 75.582 6.307 0.631
          secondary2__hrqol_auc Control 51.701 54.693 57.640 54.956 4.688 0.469
      
      ## Survivors
                        outcome     arm    p25    p50     p75   mean    sd    se
                         <char>  <char>  <num>  <num>   <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.583  0.612   0.639  0.609 0.040 0.004
          primary__hrqol_at_eof Control  0.417  0.437   0.462  0.437 0.030 0.003
             primary__hrqol_auc  Active 87.671 91.534  96.273 91.735 6.021 0.602
             primary__hrqol_auc Control 64.716 68.112  71.473 68.060 4.673 0.467
       secondary1__hrqol_at_eof  Active  0.627  0.647   0.673  0.647 0.033 0.003
       secondary1__hrqol_at_eof Control  0.455  0.466   0.487  0.468 0.025 0.002
          secondary1__hrqol_auc  Active 93.144 96.524 100.077 96.218 5.011 0.501
          secondary1__hrqol_auc Control 69.023 71.226  74.209 71.403 3.960 0.396
       secondary2__hrqol_at_eof  Active  0.668  0.685   0.700  0.682 0.025 0.002
       secondary2__hrqol_at_eof Control  0.476  0.489   0.507  0.491 0.019 0.002
          secondary2__hrqol_auc  Active 90.624 92.976  95.092 92.601 3.496 0.350
          secondary2__hrqol_auc Control 65.207 66.812  69.371 67.178 2.709 0.271

---

    Code
      sims_single_batch_no_mort_benefitters
    Output
      # Scenario specification
      - arms                               Active     Control
      - n_patients                             50          50
      - index_hrqol                             0           0
      - first_hrqol                           0.2         0.2
      - final_hrqol                           0.7         0.5
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters              0           0
      - sampling_frequency                     14          14
      
      # Simulation metadata
      - No. simulated trials          100   
      - Max. no. patients per batch   NULL   
      - No. ground-truth samples      1,000   
      - Valid range of HRQoL          [-0.757,  1.000]   
      - Significance level (alpha)    0.05   
      - Test function                 Unknown name   
      - Seed                          42   
      - Elapsed time                  0.0 secs   
      - Peak memory use               0 B   
      
      # Comparisons between arms (all patients) and select performance metrics
                                primary__hrqol_at_eof primary__hrqol_auc
                         <char>                <char>             <char>
                 Comparator arm                Active             Active
                     Target arm               Control            Control
                Mean difference                -0.151            -20.908
       Std. error of mean diff.                 0.005              0.853
                  Relative bias                 -0.02             -0.036
           Rejection proportion                  0.79               0.66
                       Coverage                  0.91               0.93
      
      # Summary statistics
      ## All participants
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.525  0.547  0.578  0.551 0.037 0.004
          primary__hrqol_at_eof Control  0.376  0.399  0.424  0.400 0.037 0.004
             primary__hrqol_auc  Active 79.071 82.483 86.772 83.005 5.645 0.564
             primary__hrqol_auc Control 58.073 62.001 65.951 62.097 5.989 0.599
       secondary1__hrqol_at_eof  Active  0.525  0.547  0.578  0.551 0.037 0.004
       secondary1__hrqol_at_eof Control  0.376  0.399  0.424  0.400 0.037 0.004
          secondary1__hrqol_auc  Active 78.113 81.439 85.676 81.967 5.591 0.559
          secondary1__hrqol_auc Control 56.968 60.835 64.707 60.862 5.875 0.588
       secondary2__hrqol_at_eof  Active  0.525  0.547  0.578  0.551 0.037 0.004
       secondary2__hrqol_at_eof Control  0.376  0.399  0.424  0.400 0.037 0.004
          secondary2__hrqol_auc  Active 71.051 74.395 78.372 74.902 5.048 0.505
          secondary2__hrqol_auc Control 51.496 54.720 57.889 54.654 5.153 0.515
      
      ## Survivors
                        outcome     arm    p25    p50    p75   mean    sd    se
                         <char>  <char>  <num>  <num>  <num>  <num> <num> <num>
          primary__hrqol_at_eof  Active  0.584  0.605  0.621  0.605 0.033 0.003
          primary__hrqol_at_eof Control  0.417  0.438  0.461  0.438 0.032 0.003
             primary__hrqol_auc  Active 87.807 91.375 93.476 91.095 5.074 0.507
             primary__hrqol_auc Control 65.074 68.138 71.574 68.049 5.123 0.512
       secondary1__hrqol_at_eof  Active  0.629  0.647  0.662  0.647 0.028 0.003
       secondary1__hrqol_at_eof Control  0.447  0.469  0.483  0.467 0.027 0.003
          secondary1__hrqol_auc  Active 93.449 96.473 98.651 96.169 4.399 0.440
          secondary1__hrqol_auc Control 67.934 71.200 74.014 71.098 4.340 0.434
       secondary2__hrqol_at_eof  Active  0.667  0.683  0.696  0.682 0.022 0.002
       secondary2__hrqol_at_eof Control  0.476  0.490  0.503  0.489 0.021 0.002
          secondary2__hrqol_auc  Active 90.515 92.938 94.504 92.702 3.133 0.313
          secondary2__hrqol_auc Control 65.018 66.879 68.916 66.814 3.004 0.300

