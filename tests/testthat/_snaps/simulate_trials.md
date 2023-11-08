# simulate_trials S3 method works

    Code
      sims_single_batch
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50    p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
       2:    primary__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
       3:       primary__hrqol_auc  Active       all 55.147 58.705 61.908 57.836
       4:       primary__hrqol_auc Control       all 39.609 41.298 45.578 42.267
       5: secondary1__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
       6: secondary1__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
       7:    secondary1__hrqol_auc  Active       all 55.535 59.081 62.346 58.209
       8:    secondary1__hrqol_auc Control       all 39.979 41.640 46.067 42.617
       9: secondary2__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
      10: secondary2__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
      11:    secondary2__hrqol_auc  Active       all 55.899 59.241 62.261 58.333
      12:    secondary2__hrqol_auc Control       all 39.804 41.462 45.778 42.324
      13:    primary__hrqol_at_eof  Active survivors  0.598  0.623  0.654  0.623
      14:    primary__hrqol_at_eof Control survivors  0.427  0.445  0.457  0.444
      15:       primary__hrqol_auc  Active survivors 61.603 64.566 67.862 64.505
      16:       primary__hrqol_auc Control survivors 44.498 46.720 47.554 46.408
      17: secondary1__hrqol_at_eof  Active survivors  0.655  0.667  0.683  0.668
      18: secondary1__hrqol_at_eof Control survivors  0.456  0.471  0.477  0.468
      19:    secondary1__hrqol_auc  Active survivors 68.192 69.692 71.633 69.581
      20:    secondary1__hrqol_auc Control survivors 48.104 49.577 50.071 49.414
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.500
      23:    secondary2__hrqol_auc  Active survivors 72.883 73.098 73.191 72.927
      24:    secondary2__hrqol_auc Control survivors 52.262 52.369 52.417 52.384
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.044 0.014
       2: 0.031 0.010
       3: 4.696 1.485
       4: 3.252 1.028
       5: 0.044 0.014
       6: 0.031 0.010
       7: 4.699 1.486
       8: 3.294 1.042
       9: 0.044 0.014
      10: 0.031 0.010
      11: 4.526 1.431
      12: 3.220 1.018
      13: 0.040 0.013
      14: 0.020 0.006
      15: 4.410 1.394
      16: 2.029 0.641
      17: 0.026 0.008
      18: 0.017 0.005
      19: 2.771 0.876
      20: 1.747 0.552
      21: 0.005 0.002
      22: 0.000 0.000
      23: 0.587 0.186
      24: 0.174 0.055
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.155                -0.179
       4:          mean_ground_truth                 -0.11                 -0.11
       5:                         sd                 0.052                 0.039
       6:                         se                 0.017                 0.012
       7:                   analysis                   all             survivors
       8:                       bias                -0.045                -0.069
       9:                    bias_se                 0.017                 0.012
      10:              relative_bias                 0.405                 0.631
      11:           relative_bias_se                 0.151                 0.111
      12:                        mse                 0.004                 0.006
      13:                     mse_se                 0.001                 0.002
      14:                   coverage                   0.8                   0.6
      15:                coverage_se                 0.126                 0.155
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.9                     1
      19:    rejection_proportion_se                 0.095                     0
      20:                      n_sim                    10                    10
      21:                        p25                -0.187                -0.206
      22:                        p50                -0.162                -0.181
      23:                        p75                -0.116                -0.158
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.569            -18.097                   -0.155
       4:            -10.135            -10.135                    -0.11
       5:              5.511              4.154                    0.052
       6:              1.743              1.314                    0.017
       7:                all          survivors                      all
       8:             -5.434             -7.962                   -0.045
       9:              1.743              1.314                    0.017
      10:              0.536              0.786                    0.405
      11:              0.172               0.13                    0.151
      12:             56.868             78.931                    0.004
      13:             18.678             20.684                    0.001
      14:                0.8                0.6                      0.8
      15:              0.126              0.155                    0.126
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.8                  1                      0.9
      19:              0.126                  0                    0.095
      20:                 10                 10                       10
      21:            -19.263            -21.648                   -0.187
      22:            -16.055            -18.078                   -0.162
      23:            -11.276            -15.548                   -0.116
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.199               -15.592               -20.168
       4:                    -0.11                -10.41                -10.41
       5:                    0.038                 5.532                 3.897
       6:                    0.012                 1.749                 1.232
       7:                survivors                   all             survivors
       8:                   -0.089                -5.182                -9.758
       9:                    0.012                 1.749                 1.232
      10:                    0.813                 0.498                 0.937
      11:                    0.109                 0.168                 0.118
      12:                    0.009                54.394               108.876
      13:                    0.002                17.985                24.169
      14:                      0.1                   0.8                   0.1
      15:                    0.095                 0.126                 0.095
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.8                     1
      19:                        0                 0.126                     0
      20:                       10                    10                    10
      21:                   -0.236                -19.31               -23.456
      22:                   -0.189               -16.074               -19.063
      23:                   -0.179               -11.367               -18.152
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.155                   -0.198               -16.009
       4:                    -0.11                    -0.11               -12.193
       5:                    0.052                    0.005                 5.434
       6:                    0.017                    0.002                 1.719
       7:                      all                survivors                   all
       8:                   -0.045                   -0.088                -3.816
       9:                    0.017                    0.002                 1.719
      10:                    0.405                    0.803                 0.313
      11:                    0.151                    0.015                 0.141
      12:                    0.004                    0.008                41.139
      13:                    0.001                        0                13.602
      14:                      0.8                        0                   0.8
      15:                    0.126                        0                 0.126
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.9                        1                   0.9
      19:                    0.095                        0                 0.095
      20:                       10                       10                    10
      21:                   -0.187                     -0.2               -19.621
      22:                   -0.162                     -0.2               -16.568
      23:                   -0.116                     -0.2               -12.131
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.543
       4:               -12.193
       5:                  0.63
       6:                 0.199
       7:             survivors
       8:                 -8.35
       9:                 0.199
      10:                 0.685
      11:                 0.016
      12:                70.078
      13:                 3.161
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:                -20.89
      22:               -20.635
      23:               -20.466
          secondary2__hrqol_auc
      
      $args
      $args$arms
         Active   Control 
       "Active" "Control" 
      
      $args$n_patients
       Active Control 
           50      50 
      
      $args$sampling_frequency
       Active Control 
           14      14 
      
      $args$index_hrqol
       Active Control 
            0       0 
      
      $args$first_hrqol
       Active Control 
          0.2     0.2 
      
      $args$final_hrqol
       Active Control 
          0.7     0.5 
      
      $args$acceleration_hrqol
       Active Control 
            0       0 
      
      $args$mortality
       Active Control 
          0.2     0.2 
      
      $args$mortality_dampening
       Active Control 
            0       0 
      
      $args$mortality_trajectory_shape
           Active     Control 
      "exp_decay" "exp_decay" 
      
      $args$prop_mortality_benefitters
       Active Control 
          0.1     0.1 
      
      $args$n_trials
      [1] 10
      
      $args$n_patients_ground_truth
      [1] 10
      
      $args$n_example_trajectories_per_arm
      [1] 10
      
      $args$include_trial_results
      [1] TRUE
      
      $args$test_fun
      [1] "welch_t_test"
      
      $args$verbose
      [1] TRUE
      
      $args$n_digits
      [1] 2
      
      $args$valid_hrqol_range
      [1] -0.757  1.000
      
      $args$alpha
      [1] 0.05
      
      $args$max_batch_size
      NULL
      
      $args$seed
      [1] 42
      
      $args$scenario
      arms                               Active     Control
      n_patients                             50          50
      index_hrqol                             0           0
      first_hrqol                           0.2         0.2
      final_hrqol                           0.7         0.5
      acceleration_hrqol                      0           0
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14
      
      
      $trial_results
                arm primary__hrqol_at_eof primary__hrqol_auc secondary1__hrqol_at_eof
         1:  Active                   0.7           73.69512                      0.7
         2:  Active                   0.7           73.69512                      0.7
         3:  Active                   0.7           73.69512                      0.7
         4:  Active                   0.7           73.69512                      0.7
         5:  Active                   0.7           73.69512                      0.7
        ---                                                                          
       996: Control                   0.0            0.00000                      0.0
       997: Control                    NA                 NA                       NA
       998: Control                    NA                 NA                       NA
       999: Control                   0.0            0.00000                       NA
      1000: Control                    NA                 NA                       NA
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:               73.9508                      0.7              72.90044
         2:               73.9508                      0.7              72.90044
         3:               73.9508                      0.7              72.90044
         4:               73.9508                      0.7              72.90044
         5:               73.9508                      0.7              72.90044
        ---                                                                     
       996:                0.0000                       NA                    NA
       997:                    NA                       NA                    NA
       998:                    NA                       NA                    NA
       999:                    NA                       NA                    NA
      1000:                    NA                       NA                    NA
            trial_id
         1:        7
         2:       10
         3:        4
         4:        4
         5:        3
        ---         
       996:        5
       997:        7
       998:        8
       999:        5
      1000:        7
      
      $example_trajectories
      $arm_level
               arm      x        y
        1:  Active   0.00 0.000000
        2:  Active   8.00 0.000000
        3:  Active   8.01 0.000674
        4:  Active   8.02 0.001348
        5:  Active   8.04 0.002024
       ---                        
      594: Control 189.59 0.493266
      595: Control 189.75 0.494949
      596: Control 189.88 0.496633
      597: Control 189.96 0.498316
      598: Control 190.00 0.500000
      
      $patient_level
               arm id   x      y
        1:  Active  1   0 0.0000
        2:  Active  1  21 0.0000
        3:  Active  1  35 0.0621
        4:  Active  1  49 0.1334
        5:  Active  1  63 0.2271
       ---                      
      248: Control 20 131 0.3887
      249: Control 20 145 0.4094
      250: Control 20 159 0.4300
      251: Control 20 173 0.4530
      252: Control 20 187 0.5000
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_two_batches_verbose
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50    p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.553  0.581  0.612  0.580
       2:    primary__hrqol_at_eof Control       all  0.400  0.410  0.438  0.413
       3:       primary__hrqol_auc  Active       all 57.195 60.325 63.323 60.057
       4:       primary__hrqol_auc Control       all 42.330 43.156 45.770 43.448
       5: secondary1__hrqol_at_eof  Active       all  0.553  0.581  0.612  0.580
       6: secondary1__hrqol_at_eof Control       all  0.400  0.410  0.438  0.413
       7:    secondary1__hrqol_auc  Active       all 57.771 60.643 63.737 60.448
       8:    secondary1__hrqol_auc Control       all 42.594 43.498 46.171 43.798
       9: secondary2__hrqol_at_eof  Active       all  0.553  0.581  0.612  0.580
      10: secondary2__hrqol_at_eof Control       all  0.400  0.410  0.438  0.413
      11:    secondary2__hrqol_auc  Active       all 57.505 60.503 63.880 60.453
      12:    secondary2__hrqol_auc Control       all 41.943 42.972 45.347 43.256
      13:    primary__hrqol_at_eof  Active survivors  0.608  0.639  0.655  0.630
      14:    primary__hrqol_at_eof Control survivors  0.429  0.446  0.458  0.440
      15:       primary__hrqol_auc  Active survivors 62.843 66.305 67.903 65.264
      16:       primary__hrqol_auc Control survivors 44.891 47.206 48.156 46.308
      17: secondary1__hrqol_at_eof  Active survivors  0.653  0.661  0.679  0.663
      18: secondary1__hrqol_at_eof Control survivors  0.466  0.476  0.478  0.468
      19:    secondary1__hrqol_auc  Active survivors 67.936 69.134 70.914 69.134
      20:    secondary1__hrqol_auc Control survivors 49.195 50.400 50.660 49.600
      21: secondary2__hrqol_at_eof  Active survivors  0.684  0.692  0.700  0.692
      22: secondary2__hrqol_at_eof Control survivors  0.488  0.500  0.500  0.495
      23:    secondary2__hrqol_auc  Active survivors 71.437 72.095 73.059 72.148
      24:    secondary2__hrqol_auc Control survivors 51.322 51.930 52.396 51.843
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.042 0.013
       2: 0.035 0.011
       3: 4.485 1.418
       4: 3.663 1.158
       5: 0.042 0.013
       6: 0.035 0.011
       7: 4.491 1.420
       8: 3.665 1.159
       9: 0.042 0.013
      10: 0.035 0.011
      11: 4.586 1.450
      12: 3.548 1.122
      13: 0.041 0.013
      14: 0.033 0.011
      15: 4.297 1.359
      16: 3.543 1.120
      17: 0.022 0.007
      18: 0.021 0.007
      19: 2.485 0.786
      20: 2.248 0.711
      21: 0.009 0.003
      22: 0.007 0.002
      23: 1.022 0.323
      24: 0.686 0.217
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.167                 -0.19
       4:          mean_ground_truth                 -0.16                 -0.16
       5:                         sd                 0.063                 0.055
       6:                         se                  0.02                 0.017
       7:                   analysis                   all             survivors
       8:                       bias                -0.007                 -0.03
       9:                    bias_se                  0.02                 0.017
      10:              relative_bias                 0.041                 0.186
      11:           relative_bias_se                 0.125                 0.109
      12:                        mse                 0.004                 0.004
      13:                     mse_se                 0.001                 0.001
      14:                   coverage                   0.9                   0.7
      15:                coverage_se                 0.095                 0.145
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.8                   0.9
      19:    rejection_proportion_se                 0.126                 0.095
      20:                      n_sim                    10                    10
      21:                        p25                -0.216                -0.226
      22:                        p50                -0.168                -0.203
      23:                        p75                 -0.15                -0.179
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -16.609            -18.957                   -0.167
       4:            -13.765            -13.765                    -0.16
       5:              6.734              5.903                    0.063
       6:               2.13              1.867                     0.02
       7:                all          survivors                      all
       8:             -2.844             -5.192                   -0.007
       9:               2.13              1.867                     0.02
      10:              0.207              0.377                    0.041
      11:              0.155              0.136                    0.125
      12:             48.906             58.319                    0.004
      13:             13.264             13.741                    0.001
      14:                0.9                0.6                      0.9
      15:              0.095              0.155                    0.095
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.8                0.9                      0.8
      19:              0.126              0.095                    0.126
      20:                 10                 10                       10
      21:            -21.422            -23.125                   -0.216
      22:            -16.699             -20.18                   -0.168
      23:            -15.016            -17.807                    -0.15
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.195                -16.65               -19.534
       4:                    -0.16               -14.321               -14.321
       5:                    0.031                  6.78                 3.529
       6:                     0.01                 2.144                 1.116
       7:                survivors                   all             survivors
       8:                   -0.035                -2.329                -5.212
       9:                     0.01                 2.144                 1.116
      10:                     0.22                 0.163                 0.364
      11:                    0.062                  0.15                 0.078
      12:                    0.002                46.789                 38.38
      13:                    0.001                12.876                10.843
      14:                      0.8                   0.9                   0.5
      15:                    0.126                 0.095                 0.158
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.8                     1
      19:                        0                 0.126                     0
      20:                       10                    10                    10
      21:                   -0.218               -21.596               -22.108
      22:                   -0.204               -16.735               -20.442
      23:                   -0.176                -14.97               -17.458
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.167                   -0.197               -17.197
       4:                    -0.16                    -0.16               -17.631
       5:                    0.063                    0.008                 6.738
       6:                     0.02                    0.003                 2.131
       7:                      all                survivors                   all
       8:                   -0.007                   -0.037                 0.433
       9:                     0.02                    0.003                 2.131
      10:                    0.041                    0.231                -0.025
      11:                    0.125                    0.016                 0.121
      12:                    0.004                    0.001                41.043
      13:                    0.001                        0                16.452
      14:                      0.9                      0.5                   0.8
      15:                    0.095                    0.158                 0.126
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.8                        1                   0.8
      19:                    0.126                        0                 0.126
      20:                       10                       10                    10
      21:                   -0.216                     -0.2               -22.498
      22:                   -0.168                   -0.199               -17.335
      23:                    -0.15                   -0.195                -15.61
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.305
       4:               -17.631
       5:                 0.844
       6:                 0.267
       7:             survivors
       8:                -2.674
       9:                 0.267
      10:                 0.152
      11:                 0.015
      12:                 7.794
      13:                 1.641
      14:                   0.5
      15:                 0.158
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -20.475
      22:               -20.225
      23:               -20.062
          secondary2__hrqol_auc
      
      $args
      $args$arms
         Active   Control 
       "Active" "Control" 
      
      $args$n_patients
       Active Control 
           50      50 
      
      $args$sampling_frequency
       Active Control 
           14      14 
      
      $args$index_hrqol
       Active Control 
            0       0 
      
      $args$first_hrqol
       Active Control 
          0.2     0.2 
      
      $args$final_hrqol
       Active Control 
          0.7     0.5 
      
      $args$acceleration_hrqol
       Active Control 
            0       0 
      
      $args$mortality
       Active Control 
          0.2     0.2 
      
      $args$mortality_dampening
       Active Control 
            0       0 
      
      $args$mortality_trajectory_shape
           Active     Control 
      "exp_decay" "exp_decay" 
      
      $args$prop_mortality_benefitters
       Active Control 
          0.1     0.1 
      
      $args$n_trials
      [1] 10
      
      $args$n_patients_ground_truth
      [1] 10
      
      $args$n_example_trajectories_per_arm
      [1] 10
      
      $args$include_trial_results
      [1] FALSE
      
      $args$test_fun
      [1] "welch_t_test"
      
      $args$verbose
      [1] TRUE
      
      $args$n_digits
      [1] 2
      
      $args$valid_hrqol_range
      [1] -0.757  1.000
      
      $args$alpha
      [1] 0.05
      
      $args$max_batch_size
      [1] 500
      
      $args$seed
      [1] 42
      
      $args$scenario
      arms                               Active     Control
      n_patients                             50          50
      index_hrqol                             0           0
      first_hrqol                           0.2         0.2
      final_hrqol                           0.7         0.5
      acceleration_hrqol                      0           0
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14
      
      
      $trial_results
      $trial_results[[1]]
      NULL
      
      
      $example_trajectories
      $arm_level
               arm      x        y
        1:  Active   0.00 0.000000
        2:  Active   8.00 0.000000
        3:  Active   8.01 0.000674
        4:  Active   8.02 0.001348
        5:  Active   8.04 0.002024
       ---                        
      594: Control 189.59 0.493266
      595: Control 189.75 0.494949
      596: Control 189.88 0.496633
      597: Control 189.96 0.498316
      598: Control 190.00 0.500000
      
      $patient_level
               arm id   x      y
        1:  Active  1   0 0.0000
        2:  Active  1  21 0.0000
        3:  Active  1  35 0.0621
        4:  Active  1  49 0.1334
        5:  Active  1  63 0.2271
       ---                      
      248: Control 20 131 0.3887
      249: Control 20 145 0.4094
      250: Control 20 159 0.4300
      251: Control 20 173 0.4530
      252: Control 20 187 0.5000
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_single_batch_without_examples
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50    p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
       2:    primary__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
       3:       primary__hrqol_auc  Active       all 55.147 58.705 61.908 57.836
       4:       primary__hrqol_auc Control       all 39.609 41.298 45.578 42.267
       5: secondary1__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
       6: secondary1__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
       7:    secondary1__hrqol_auc  Active       all 55.535 59.081 62.346 58.209
       8:    secondary1__hrqol_auc Control       all 39.979 41.640 46.067 42.617
       9: secondary2__hrqol_at_eof  Active       all  0.535  0.567  0.598  0.559
      10: secondary2__hrqol_at_eof Control       all  0.380  0.395  0.438  0.404
      11:    secondary2__hrqol_auc  Active       all 55.899 59.241 62.261 58.333
      12:    secondary2__hrqol_auc Control       all 39.804 41.462 45.778 42.324
      13:    primary__hrqol_at_eof  Active survivors  0.598  0.623  0.654  0.623
      14:    primary__hrqol_at_eof Control survivors  0.427  0.445  0.457  0.444
      15:       primary__hrqol_auc  Active survivors 61.603 64.566 67.862 64.505
      16:       primary__hrqol_auc Control survivors 44.498 46.720 47.554 46.408
      17: secondary1__hrqol_at_eof  Active survivors  0.655  0.667  0.683  0.668
      18: secondary1__hrqol_at_eof Control survivors  0.456  0.471  0.477  0.468
      19:    secondary1__hrqol_auc  Active survivors 68.192 69.692 71.633 69.581
      20:    secondary1__hrqol_auc Control survivors 48.104 49.577 50.071 49.414
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.500
      23:    secondary2__hrqol_auc  Active survivors 72.883 73.098 73.191 72.927
      24:    secondary2__hrqol_auc Control survivors 52.262 52.369 52.417 52.384
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.044 0.014
       2: 0.031 0.010
       3: 4.696 1.485
       4: 3.252 1.028
       5: 0.044 0.014
       6: 0.031 0.010
       7: 4.699 1.486
       8: 3.294 1.042
       9: 0.044 0.014
      10: 0.031 0.010
      11: 4.526 1.431
      12: 3.220 1.018
      13: 0.040 0.013
      14: 0.020 0.006
      15: 4.410 1.394
      16: 2.029 0.641
      17: 0.026 0.008
      18: 0.017 0.005
      19: 2.771 0.876
      20: 1.747 0.552
      21: 0.005 0.002
      22: 0.000 0.000
      23: 0.587 0.186
      24: 0.174 0.055
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.155                -0.179
       4:          mean_ground_truth                 -0.11                 -0.11
       5:                         sd                 0.052                 0.039
       6:                         se                 0.017                 0.012
       7:                   analysis                   all             survivors
       8:                       bias                -0.045                -0.069
       9:                    bias_se                 0.017                 0.012
      10:              relative_bias                 0.405                 0.631
      11:           relative_bias_se                 0.151                 0.111
      12:                        mse                 0.004                 0.006
      13:                     mse_se                 0.001                 0.002
      14:                   coverage                   0.8                   0.6
      15:                coverage_se                 0.126                 0.155
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.9                     1
      19:    rejection_proportion_se                 0.095                     0
      20:                      n_sim                    10                    10
      21:                        p25                -0.187                -0.206
      22:                        p50                -0.162                -0.181
      23:                        p75                -0.116                -0.158
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.569            -18.097                   -0.155
       4:            -10.135            -10.135                    -0.11
       5:              5.511              4.154                    0.052
       6:              1.743              1.314                    0.017
       7:                all          survivors                      all
       8:             -5.434             -7.962                   -0.045
       9:              1.743              1.314                    0.017
      10:              0.536              0.786                    0.405
      11:              0.172               0.13                    0.151
      12:             56.868             78.931                    0.004
      13:             18.678             20.684                    0.001
      14:                0.8                0.6                      0.8
      15:              0.126              0.155                    0.126
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.8                  1                      0.9
      19:              0.126                  0                    0.095
      20:                 10                 10                       10
      21:            -19.263            -21.648                   -0.187
      22:            -16.055            -18.078                   -0.162
      23:            -11.276            -15.548                   -0.116
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.199               -15.592               -20.168
       4:                    -0.11                -10.41                -10.41
       5:                    0.038                 5.532                 3.897
       6:                    0.012                 1.749                 1.232
       7:                survivors                   all             survivors
       8:                   -0.089                -5.182                -9.758
       9:                    0.012                 1.749                 1.232
      10:                    0.813                 0.498                 0.937
      11:                    0.109                 0.168                 0.118
      12:                    0.009                54.394               108.876
      13:                    0.002                17.985                24.169
      14:                      0.1                   0.8                   0.1
      15:                    0.095                 0.126                 0.095
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.8                     1
      19:                        0                 0.126                     0
      20:                       10                    10                    10
      21:                   -0.236                -19.31               -23.456
      22:                   -0.189               -16.074               -19.063
      23:                   -0.179               -11.367               -18.152
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.155                   -0.198               -16.009
       4:                    -0.11                    -0.11               -12.193
       5:                    0.052                    0.005                 5.434
       6:                    0.017                    0.002                 1.719
       7:                      all                survivors                   all
       8:                   -0.045                   -0.088                -3.816
       9:                    0.017                    0.002                 1.719
      10:                    0.405                    0.803                 0.313
      11:                    0.151                    0.015                 0.141
      12:                    0.004                    0.008                41.139
      13:                    0.001                        0                13.602
      14:                      0.8                        0                   0.8
      15:                    0.126                        0                 0.126
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.9                        1                   0.9
      19:                    0.095                        0                 0.095
      20:                       10                       10                    10
      21:                   -0.187                     -0.2               -19.621
      22:                   -0.162                     -0.2               -16.568
      23:                   -0.116                     -0.2               -12.131
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.543
       4:               -12.193
       5:                  0.63
       6:                 0.199
       7:             survivors
       8:                 -8.35
       9:                 0.199
      10:                 0.685
      11:                 0.016
      12:                70.078
      13:                 3.161
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:                -20.89
      22:               -20.635
      23:               -20.466
          secondary2__hrqol_auc
      
      $args
      $args$arms
         Active   Control 
       "Active" "Control" 
      
      $args$n_patients
       Active Control 
           50      50 
      
      $args$sampling_frequency
       Active Control 
           14      14 
      
      $args$index_hrqol
       Active Control 
            0       0 
      
      $args$first_hrqol
       Active Control 
          0.2     0.2 
      
      $args$final_hrqol
       Active Control 
          0.7     0.5 
      
      $args$acceleration_hrqol
       Active Control 
            0       0 
      
      $args$mortality
       Active Control 
          0.2     0.2 
      
      $args$mortality_dampening
       Active Control 
            0       0 
      
      $args$mortality_trajectory_shape
           Active     Control 
      "exp_decay" "exp_decay" 
      
      $args$prop_mortality_benefitters
       Active Control 
          0.1     0.1 
      
      $args$n_trials
      [1] 10
      
      $args$n_patients_ground_truth
      [1] 10
      
      $args$n_example_trajectories_per_arm
      [1] 0
      
      $args$include_trial_results
      [1] TRUE
      
      $args$test_fun
      [1] "welch_t_test"
      
      $args$verbose
      [1] TRUE
      
      $args$n_digits
      [1] 2
      
      $args$valid_hrqol_range
      [1] -0.757  1.000
      
      $args$alpha
      [1] 0.05
      
      $args$max_batch_size
      NULL
      
      $args$seed
      [1] 42
      
      $args$scenario
      arms                               Active     Control
      n_patients                             50          50
      index_hrqol                             0           0
      first_hrqol                           0.2         0.2
      final_hrqol                           0.7         0.5
      acceleration_hrqol                      0           0
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14
      
      
      $trial_results
                arm primary__hrqol_at_eof primary__hrqol_auc secondary1__hrqol_at_eof
         1:  Active                   0.7           73.69512                      0.7
         2:  Active                   0.7           73.69512                      0.7
         3:  Active                   0.7           73.69512                      0.7
         4:  Active                   0.7           73.69512                      0.7
         5:  Active                   0.7           73.69512                      0.7
        ---                                                                          
       996: Control                   0.0            0.00000                      0.0
       997: Control                    NA                 NA                       NA
       998: Control                    NA                 NA                       NA
       999: Control                   0.0            0.00000                       NA
      1000: Control                    NA                 NA                       NA
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:               73.9508                      0.7              72.90044
         2:               73.9508                      0.7              72.90044
         3:               73.9508                      0.7              72.90044
         4:               73.9508                      0.7              72.90044
         5:               73.9508                      0.7              72.90044
        ---                                                                     
       996:                0.0000                       NA                    NA
       997:                    NA                       NA                    NA
       998:                    NA                       NA                    NA
       999:                    NA                       NA                    NA
      1000:                    NA                       NA                    NA
            trial_id
         1:        7
         2:       10
         3:        4
         4:        4
         5:        3
        ---         
       996:        5
       997:        7
       998:        8
       999:        5
      1000:        7
      
      $example_trajectories
      $example_trajectories[[1]]
      NULL
      
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_single_batch_no_mort_benefitters
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50    p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.535  0.560  0.570  0.557
       2:    primary__hrqol_at_eof Control       all  0.382  0.405  0.430  0.408
       3:       primary__hrqol_auc  Active       all 55.353 57.853 59.432 57.732
       4:       primary__hrqol_auc Control       all 40.266 42.536 45.180 42.813
       5: secondary1__hrqol_at_eof  Active       all  0.535  0.560  0.570  0.557
       6: secondary1__hrqol_at_eof Control       all  0.382  0.405  0.430  0.408
       7:    secondary1__hrqol_auc  Active       all 55.723 58.396 59.773 58.123
       8:    secondary1__hrqol_auc Control       all 40.540 42.869 45.522 43.161
       9: secondary2__hrqol_at_eof  Active       all  0.535  0.560  0.570  0.557
      10: secondary2__hrqol_at_eof Control       all  0.382  0.405  0.430  0.408
      11:    secondary2__hrqol_auc  Active       all 56.039 58.232 59.670 58.132
      12:    secondary2__hrqol_auc Control       all 40.125 42.543 45.310 42.829
      13:    primary__hrqol_at_eof  Active survivors  0.623  0.636  0.658  0.634
      14:    primary__hrqol_at_eof Control survivors  0.422  0.439  0.450  0.439
      15:       primary__hrqol_auc  Active survivors 64.370 65.960 67.969 65.647
      16:       primary__hrqol_auc Control survivors 44.281 46.023 47.352 46.036
      17: secondary1__hrqol_at_eof  Active survivors  0.665  0.667  0.684  0.672
      18: secondary1__hrqol_at_eof Control survivors  0.455  0.472  0.478  0.467
      19:    secondary1__hrqol_auc  Active survivors 69.114 69.727 71.358 70.150
      20:    secondary1__hrqol_auc Control survivors 48.131 49.911 50.573 49.417
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.491  0.500  0.500  0.495
      23:    secondary2__hrqol_auc  Active survivors 72.834 72.891 73.177 72.838
      24:    secondary2__hrqol_auc Control survivors 51.284 52.395 52.638 51.990
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.036 0.011
       2: 0.034 0.011
       3: 3.769 1.192
       4: 3.428 1.084
       5: 0.036 0.011
       6: 0.034 0.011
       7: 3.794 1.200
       8: 3.500 1.107
       9: 0.036 0.011
      10: 0.034 0.011
      11: 3.753 1.187
      12: 3.507 1.109
      13: 0.032 0.010
      14: 0.022 0.007
      15: 3.508 1.109
      16: 2.165 0.685
      17: 0.019 0.006
      18: 0.021 0.007
      19: 2.167 0.685
      20: 2.210 0.699
      21: 0.006 0.002
      22: 0.008 0.003
      23: 0.605 0.191
      24: 0.915 0.289
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.149                -0.195
       4:          mean_ground_truth                 -0.11                 -0.11
       5:                         sd                 0.049                 0.038
       6:                         se                 0.015                 0.012
       7:                   analysis                   all             survivors
       8:                       bias                -0.039                -0.085
       9:                    bias_se                 0.015                 0.012
      10:              relative_bias                 0.356                 0.772
      11:           relative_bias_se                 0.141                 0.108
      12:                        mse                 0.004                 0.008
      13:                     mse_se                 0.001                 0.002
      14:                   coverage                   0.9                   0.3
      15:                coverage_se                 0.095                 0.145
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.9                     1
      19:    rejection_proportion_se                 0.095                     0
      20:                      n_sim                    10                    10
      21:                        p25                -0.176                -0.216
      22:                        p50                -0.157                -0.203
      23:                        p75                -0.118                -0.182
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:             -14.92             -19.61                   -0.149
       4:             -9.273             -9.273                    -0.11
       5:              4.985              3.885                    0.049
       6:              1.576              1.229                    0.015
       7:                all          survivors                      all
       8:             -5.647            -10.338                   -0.039
       9:              1.576              1.229                    0.015
      10:              0.609              1.115                    0.356
      11:               0.17              0.132                    0.141
      12:             54.252            120.449                    0.004
      13:             18.311             22.001                    0.001
      14:                0.9                0.2                      0.9
      15:              0.095              0.126                    0.095
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.9                  1                      0.9
      19:              0.095                  0                    0.095
      20:                 10                 10                       10
      21:            -17.675            -22.058                   -0.176
      22:            -15.447             -20.61                   -0.157
      23:            -11.987            -18.625                   -0.118
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.205               -14.962               -20.733
       4:                    -0.11                -9.636                -9.636
       5:                    0.031                 5.069                 3.339
       6:                     0.01                 1.603                 1.056
       7:                survivors                   all             survivors
       8:                   -0.095                -5.326               -11.098
       9:                     0.01                 1.603                 1.056
      10:                    0.867                 0.553                 1.152
      11:                     0.09                 0.166                  0.11
      12:                     0.01                51.491                133.19
      13:                    0.002                17.662                22.804
      14:                      0.1                   0.9                   0.1
      15:                    0.095                 0.095                 0.095
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.9                     1
      19:                        0                 0.095                     0
      20:                       10                    10                    10
      21:                   -0.231               -17.724               -23.157
      22:                   -0.205               -15.692               -20.643
      23:                   -0.188               -11.904                -19.08
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.149                   -0.203               -15.303
       4:                    -0.11                    -0.11               -11.961
       5:                    0.049                    0.011                 5.128
       6:                    0.015                    0.003                 1.622
       7:                      all                survivors                   all
       8:                   -0.039                   -0.093                -3.342
       9:                    0.015                    0.003                 1.622
      10:                    0.356                    0.845                 0.279
      11:                    0.141                    0.031                 0.136
      12:                    0.004                    0.009                34.838
      13:                    0.001                    0.001                13.213
      14:                      0.9                        0                   0.9
      15:                    0.095                        0                 0.095
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.9                        1                   0.9
      19:                    0.095                        0                 0.095
      20:                       10                       10                    10
      21:                   -0.176                   -0.209               -18.152
      22:                   -0.157                     -0.2                -16.18
      23:                   -0.118                     -0.2               -11.756
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.849
       4:               -11.961
       5:                 1.181
       6:                 0.373
       7:             survivors
       8:                -8.888
       9:                 0.373
      10:                 0.743
      11:                 0.031
      12:                80.246
      13:                 6.776
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -21.572
      22:               -20.543
      23:               -20.386
          secondary2__hrqol_auc
      
      $args
      $args$arms
         Active   Control 
       "Active" "Control" 
      
      $args$n_patients
       Active Control 
           50      50 
      
      $args$sampling_frequency
       Active Control 
           14      14 
      
      $args$index_hrqol
       Active Control 
            0       0 
      
      $args$first_hrqol
       Active Control 
          0.2     0.2 
      
      $args$final_hrqol
       Active Control 
          0.7     0.5 
      
      $args$acceleration_hrqol
       Active Control 
            0       0 
      
      $args$mortality
       Active Control 
          0.2     0.2 
      
      $args$mortality_dampening
       Active Control 
            0       0 
      
      $args$mortality_trajectory_shape
           Active     Control 
      "exp_decay" "exp_decay" 
      
      $args$prop_mortality_benefitters
       Active Control 
            0       0 
      
      $args$n_trials
      [1] 10
      
      $args$n_patients_ground_truth
      [1] 10
      
      $args$n_example_trajectories_per_arm
      [1] 10
      
      $args$include_trial_results
      [1] TRUE
      
      $args$test_fun
      [1] "welch_t_test"
      
      $args$verbose
      [1] TRUE
      
      $args$n_digits
      [1] 2
      
      $args$valid_hrqol_range
      [1] -0.757  1.000
      
      $args$alpha
      [1] 0.05
      
      $args$max_batch_size
      NULL
      
      $args$seed
      [1] 42
      
      $args$scenario
      arms                               Active     Control
      n_patients                             50          50
      index_hrqol                             0           0
      first_hrqol                           0.2         0.2
      final_hrqol                           0.7         0.5
      acceleration_hrqol                      0           0
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters              0           0
      sampling_frequency                     14          14
      
      
      $trial_results
                arm primary__hrqol_at_eof primary__hrqol_auc secondary1__hrqol_at_eof
         1:  Active                   0.7           74.27863                      0.7
         2:  Active                   0.7           74.27863                      0.7
         3:  Active                   0.7           74.27863                      0.7
         4:  Active                   0.7           74.27863                      0.7
         5:  Active                   0.7           74.27863                      0.7
        ---                                                                          
       996: Control                   0.5           43.05267                      0.5
       997: Control                   0.5           47.66116                      0.5
       998: Control                    NA                 NA                       NA
       999: Control                   0.0            0.00000                       NA
      1000: Control                   0.5           41.07652                      0.5
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:              74.84221                      0.7              76.30699
         2:              74.84221                      0.7              76.30699
         3:              74.84221                      0.7              76.30699
         4:              74.84221                      0.7              76.30699
         5:              74.84221                      0.7              76.30699
        ---                                                                     
       996:              54.25893                      0.5              43.06694
       997:              49.40627                      0.5              54.43062
       998:                    NA                       NA                    NA
       999:                    NA                       NA                    NA
      1000:              43.71805                      0.5              50.63342
            trial_id
         1:        8
         2:        1
         3:        4
         4:        7
         5:        2
        ---         
       996:        8
       997:        6
       998:        1
       999:        5
      1000:        5
      
      $example_trajectories
      $arm_level
               arm      x        y
        1:  Active   0.00 0.000000
        2:  Active   8.00 0.000000
        3:  Active   8.01 0.000674
        4:  Active   8.02 0.001348
        5:  Active   8.04 0.002024
       ---                        
      594: Control 189.59 0.493266
      595: Control 189.75 0.494949
      596: Control 189.88 0.496633
      597: Control 189.96 0.498316
      598: Control 190.00 0.500000
      
      $patient_level
               arm id   x      y
        1:  Active  1   0 0.0000
        2:  Active  1  21 0.0000
        3:  Active  1  35 0.0621
        4:  Active  1  49 0.1334
        5:  Active  1  63 0.2271
       ---                      
      236: Control 20 131 0.3887
      237: Control 20 145 0.4094
      238: Control 20 159 0.4300
      239: Control 20 173 0.4530
      240: Control 20 187 0.5000
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

