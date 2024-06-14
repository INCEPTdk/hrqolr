# simulate_trials S3 method works

    n_trials should be a single integer greater than 0

---

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
      sims_single_batch$summary_stats
    Output
                           outcome     arm  analysis    p25    p50    p75   mean
                            <char>  <char>    <fctr>  <num>  <num>  <num>  <num>
       1:    primary__hrqol_at_eof  Active       all  0.522  0.557  0.584  0.554
       2:    primary__hrqol_at_eof Control       all  0.379  0.400  0.419  0.398
       3:       primary__hrqol_auc  Active       all 78.698 83.636 88.164 83.488
       4:       primary__hrqol_auc Control       all 58.955 62.349 64.542 62.041
       5: secondary1__hrqol_at_eof  Active       all  0.522  0.557  0.584  0.554
       6: secondary1__hrqol_at_eof Control       all  0.379  0.400  0.419  0.399
       7:    secondary1__hrqol_auc  Active       all 77.565 82.682 86.926 82.445
       8:    secondary1__hrqol_auc Control       all 57.653 61.181 63.240 60.790
       9: secondary2__hrqol_at_eof  Active       all  0.522  0.557  0.584  0.554
      10: secondary2__hrqol_at_eof Control       all  0.379  0.400  0.419  0.399
      11:    secondary2__hrqol_auc  Active       all 70.875 75.601 79.573 75.290
      12:    secondary2__hrqol_auc Control       all 51.643 54.642 57.128 54.479
      13:    primary__hrqol_at_eof  Active survivors  0.586  0.604  0.626  0.606
      14:    primary__hrqol_at_eof Control survivors  0.419  0.435  0.456  0.436
      15:       primary__hrqol_auc  Active survivors 87.783 91.138 95.122 91.282
      16:       primary__hrqol_auc Control survivors 65.327 67.608 70.816 67.896
      17: secondary1__hrqol_at_eof  Active survivors  0.633  0.653  0.669  0.650
      18: secondary1__hrqol_at_eof Control survivors  0.453  0.471  0.483  0.468
      19:    secondary1__hrqol_auc  Active survivors 94.157 97.072 99.154 96.735
      20:    secondary1__hrqol_auc Control survivors 68.697 71.718 73.680 71.371
      21: secondary2__hrqol_at_eof  Active survivors  0.669  0.683  0.698  0.683
      22: secondary2__hrqol_at_eof Control survivors  0.478  0.488  0.503  0.490
      23:    secondary2__hrqol_auc  Active survivors 90.900 92.661 94.861 92.817
      24:    secondary2__hrqol_auc Control survivors 65.220 66.714 68.847 66.922
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
          <num> <num>
       1: 0.042 0.004
       2: 0.033 0.003
       3: 6.520 0.652
       4: 5.151 0.515
       5: 0.042 0.004
       6: 0.033 0.003
       7: 6.421 0.642
       8: 5.076 0.508
       9: 0.042 0.004
      10: 0.033 0.003
      11: 5.707 0.571
      12: 4.494 0.449
      13: 0.034 0.003
      14: 0.026 0.003
      15: 5.445 0.545
      16: 4.102 0.410
      17: 0.029 0.003
      18: 0.025 0.002
      19: 4.516 0.452
      20: 3.875 0.388
      21: 0.022 0.002
      22: 0.019 0.002
      23: 3.126 0.313
      24: 2.615 0.262
             sd    se

---

    Code
      sims_single_batch$comparisons
    Output
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
                              <char>                <char>                <char>
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.155                 -0.17
       5:          mean_ground_truth                -0.155                -0.155
       6:                         sd                 0.049                  0.04
       7:                         se                 0.005                 0.004
       8:                       bias                     0                -0.015
       9:                    bias_se                 0.005                 0.004
      10:              relative_bias                 0.003                 0.094
      11:           relative_bias_se                 0.031                 0.026
      12:                        mse                 0.002                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.96                  0.98
      15:                coverage_se                  0.02                 0.014
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.84                  0.92
      19:    rejection_proportion_se                 0.037                 0.027
      20:                      n_sim                   100                   100
      21:                        p25                -0.189                -0.193
      22:                        p50                -0.157                -0.171
      23:                        p75                -0.127                -0.146
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
                      <char>             <char>                   <char>
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -21.447            -23.386                   -0.155
       5:            -17.509            -17.509                   -0.155
       6:              7.576              6.332                    0.049
       7:              0.758              0.633                    0.005
       8:             -3.938             -5.877                        0
       9:              0.758              0.633                    0.005
      10:              0.225              0.336                    0.003
      11:              0.043              0.036                    0.031
      12:             72.328             74.233                    0.002
      13:              9.253              8.403                        0
      14:               0.95               0.88                     0.96
      15:              0.022              0.032                     0.02
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.76               0.88                     0.84
      19:              0.043              0.032                    0.037
      20:                100                100                      100
      21:            -26.354            -26.949                   -0.189
      22:            -21.712            -23.779                   -0.157
      23:             -16.42            -19.691                   -0.127
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
                            <char>                <char>                <char>
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.182               -21.654               -25.364
       5:                   -0.155               -18.468               -18.468
       6:                    0.037                 7.471                 5.672
       7:                    0.004                 0.747                 0.567
       8:                   -0.027                -3.186                -6.896
       9:                    0.004                 0.747                 0.567
      10:                    0.175                 0.173                 0.373
      11:                    0.024                  0.04                 0.031
      12:                    0.002                 65.41                79.403
      13:                        0                 8.475                 8.048
      14:                     0.89                  0.95                  0.82
      15:                    0.031                 0.022                 0.038
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                     0.99                  0.77                  0.96
      19:                     0.01                 0.042                  0.02
      20:                      100                   100                   100
      21:                   -0.202               -26.463               -29.184
      22:                   -0.183               -22.029               -25.381
      23:                   -0.159                -16.87                -22.06
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
                            <char>                   <char>                <char>
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.155                   -0.193               -20.811
       5:                   -0.155                   -0.155               -20.898
       6:                    0.049                    0.026                 6.612
       7:                    0.005                    0.003                 0.661
       8:                        0                   -0.038                 0.087
       9:                    0.005                    0.003                 0.661
      10:                    0.003                    0.248                -0.004
      11:                    0.031                    0.017                 0.032
      12:                    0.002                    0.002                43.293
      13:                        0                        0                 5.799
      14:                     0.96                     0.79                  0.96
      15:                     0.02                    0.041                  0.02
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.84                        1                  0.81
      19:                    0.037                        0                 0.039
      20:                      100                      100                   100
      21:                   -0.189                   -0.208               -25.273
      22:                   -0.157                   -0.192               -21.115
      23:                   -0.127                   -0.175               -16.661
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
                         <char>
       1:                Active
       2:               Control
       3:             survivors
       4:               -25.895
       5:               -20.898
       6:                 3.613
       7:                 0.361
       8:                -4.997
       9:                 0.361
      10:                 0.239
      11:                 0.017
      12:                37.897
      13:                 4.522
      14:                  0.81
      15:                 0.039
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -27.737
      22:               -25.999
      23:               -23.296
          secondary2__hrqol_auc

---

    Code
      sims_single_batch$trial_results
    Output
                 arm primary__hrqol_at_eof primary__hrqol_auc
              <char>                 <num>              <num>
          1:  Active                  0.80          125.72890
          2:  Active                  0.80          125.72890
          3:  Active                  0.80          125.72890
          4:  Active                  0.80          125.72890
          5:  Active                  0.80          125.72890
         ---                                                 
       9996: Control                  0.63           91.33126
       9997: Control                  0.40           55.85026
       9998: Control                    NA                 NA
       9999: Control                    NA                 NA
      10000: Control                  0.44           59.68898
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
                                <num>                 <num>                    <num>
          1:                     0.80             123.30160                     0.80
          2:                     0.80             123.30160                     0.80
          3:                     0.80             123.30160                     0.80
          4:                     0.80             123.30160                     0.80
          5:                     0.80             123.30160                     0.80
         ---                                                                        
       9996:                     0.63              88.67601                     0.63
       9997:                     0.40              55.46753                     0.40
       9998:                       NA                    NA                       NA
       9999:                       NA                    NA                       NA
      10000:                     0.44              59.60447                     0.44
             secondary2__hrqol_auc trial_id
                             <num>    <int>
          1:             112.26954       82
          2:             112.26954       22
          3:             112.26954       10
          4:             112.26954       67
          5:             112.26954       70
         ---                               
       9996:              86.41995       46
       9997:              54.15163       12
       9998:                    NA       42
       9999:                    NA       64
      10000:              60.87672       19

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

