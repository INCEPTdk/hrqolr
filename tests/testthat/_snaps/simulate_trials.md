# simulate_trials S3 method works

    Code
      sims_single_batch
    Output
      $summary_stats
                           outcome     arm  analysis     p25     p50     p75    mean
       1:    primary__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       2:    primary__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       3:       primary__hrqol_auc  Active       all  84.259  89.061  89.441  87.080
       4:       primary__hrqol_auc Control       all  70.082  72.749  74.563  71.903
       5: secondary1__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       6: secondary1__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       7:    secondary1__hrqol_auc  Active       all  83.153  87.874  88.572  86.006
       8:    secondary1__hrqol_auc Control       all  68.887  71.466  73.355  70.705
       9: secondary2__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
      10: secondary2__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
      11:    secondary2__hrqol_auc  Active       all  78.088  82.286  83.530  80.903
      12:    secondary2__hrqol_auc Control       all  63.051  66.284  67.758  65.410
      13:    primary__hrqol_at_eof  Active survivors   0.754   0.781   0.833   0.794
      14:    primary__hrqol_at_eof Control survivors   0.602   0.620   0.637   0.617
      15:       primary__hrqol_auc  Active survivors  92.621  95.589 101.595  96.838
      16:       primary__hrqol_auc Control survivors  77.481  78.937  79.408  78.305
      17: secondary1__hrqol_at_eof  Active survivors   0.832   0.846   0.864   0.854
      18: secondary1__hrqol_at_eof Control survivors   0.650   0.666   0.673   0.662
      19:    secondary1__hrqol_auc  Active survivors 100.088 102.137 104.649 102.900
      20:    secondary1__hrqol_auc Control survivors  80.504  82.872  83.996  82.615
      21: secondary2__hrqol_at_eof  Active survivors   0.885   0.890   0.895   0.892
      22: secondary2__hrqol_at_eof Control survivors   0.684   0.698   0.704   0.693
      23:    secondary2__hrqol_auc  Active survivors 100.505 101.076 101.888 101.099
      24:    secondary2__hrqol_auc Control survivors  78.982  80.440  81.456  80.029
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.041 0.013
       2: 0.032 0.010
       3: 5.412 1.711
       4: 3.672 1.161
       5: 0.041 0.013
       6: 0.032 0.010
       7: 5.332 1.686
       8: 3.647 1.153
       9: 0.041 0.013
      10: 0.032 0.010
      11: 4.943 1.563
      12: 3.454 1.092
      13: 0.043 0.013
      14: 0.022 0.007
      15: 5.711 1.806
      16: 2.581 0.816
      17: 0.029 0.009
      18: 0.018 0.006
      19: 4.094 1.295
      20: 2.650 0.838
      21: 0.013 0.004
      22: 0.012 0.004
      23: 2.027 0.641
      24: 1.765 0.558
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.147                -0.176
       4:          mean_ground_truth                -0.165                -0.165
       5:                         sd                 0.056                 0.052
       6:                         se                 0.018                 0.017
       7:                   analysis                   all             survivors
       8:                       bias                 0.018                -0.011
       9:                    bias_se                 0.018                 0.017
      10:              relative_bias                 -0.11                 0.069
      11:           relative_bias_se                 0.107                   0.1
      12:                        mse                 0.003                 0.003
      13:                     mse_se                 0.001                 0.001
      14:                   coverage                     1                     1
      15:                coverage_se                     0                     0
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.7                     1
      19:    rejection_proportion_se                 0.145                     0
      20:                      n_sim                    10                    10
      21:                        p25                -0.179                -0.221
      22:                        p50                -0.147                -0.178
      23:                        p75                -0.123                -0.134
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.178            -18.533                   -0.147
       4:             -15.87             -15.87                   -0.165
       5:               7.39              6.543                    0.056
       6:              2.337              2.069                    0.018
       7:                all          survivors                      all
       8:              0.692             -2.664                    0.018
       9:              2.337              2.069                    0.018
      10:             -0.044              0.168                    -0.11
      11:              0.147               0.13                    0.107
      12:             49.625             45.623                    0.003
      13:              24.99             15.231                    0.001
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.5                0.6                      0.7
      19:              0.158              0.155                    0.145
      20:                 10                 10                       10
      21:            -19.528             -24.89                   -0.179
      22:            -15.033             -18.85                   -0.147
      23:            -13.098            -12.054                   -0.123
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.192               -15.301               -20.284
       4:                   -0.165               -16.043               -16.043
       5:                    0.022                 7.296                 3.311
       6:                    0.007                 2.307                 1.047
       7:                survivors                   all             survivors
       8:                   -0.027                 0.742                -4.241
       9:                    0.007                 2.307                 1.047
      10:                    0.162                -0.046                 0.264
      11:                    0.043                 0.144                 0.065
      12:                    0.001                48.464                27.852
      13:                        0                 23.96                 9.913
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.5                     1
      19:                        0                 0.158                     0
      20:                       10                    10                    10
      21:                   -0.207               -19.733               -22.491
      22:                   -0.184               -15.229                -19.83
      23:                   -0.178                -12.94               -18.861
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.147                   -0.199               -15.493
       4:                   -0.165                   -0.165               -19.106
       5:                    0.056                    0.017                 6.583
       6:                    0.018                    0.005                 2.082
       7:                      all                survivors                   all
       8:                    0.018                   -0.034                 3.613
       9:                    0.018                    0.005                 2.082
      10:                    -0.11                    0.203                -0.189
      11:                    0.107                    0.032                 0.109
      12:                    0.003                    0.001                52.048
      13:                    0.001                        0                26.483
      14:                        1                      0.7                   0.9
      15:                        0                    0.145                 0.095
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.5
      19:                    0.145                        0                 0.158
      20:                       10                       10                    10
      21:                   -0.179                   -0.208               -19.471
      22:                   -0.147                   -0.196               -15.855
      23:                   -0.123                   -0.188               -13.191
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:                -21.07
       4:               -19.106
       5:                 2.565
       6:                 0.811
       7:             survivors
       8:                -1.965
       9:                 0.811
      10:                 0.103
      11:                 0.042
      12:                 9.779
      13:                 4.745
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -22.463
      22:               -20.936
      23:               -19.416
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
         1:  Active                    NA                 NA                       NA
         2:  Active                  0.91          113.78288                     0.91
         3:  Active                    NA                 NA                       NA
         4:  Active                    NA                 NA                       NA
         5:  Active                  0.85          102.13590                     0.85
        ---                                                                          
       996: Control                  0.72           94.68755                     0.72
       997: Control                  0.00            4.20000                       NA
       998: Control                  0.64           79.43466                     0.64
       999: Control                  0.00            1.12000                       NA
      1000: Control                  0.00            2.56500                     0.00
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:                    NA                       NA                    NA
         2:             112.16219                     0.91             107.99493
         3:                    NA                       NA                    NA
         4:                    NA                       NA                    NA
         5:             100.93165                     0.85              97.64827
        ---                                                                     
       996:              93.18789                     0.72              87.24000
       997:                    NA                       NA                    NA
       998:              78.46539                     0.64              73.10000
       999:                    NA                       NA                    NA
      1000:               0.00000                       NA                    NA
            trial_id
         1:        9
         2:        3
         3:        8
         4:       10
         5:        2
        ---         
       996:        1
       997:        9
       998:       10
       999:        1
      1000:       10
      
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
               arm id   x    y
        1:  Active  1   0 0.00
        2:  Active  1  21 0.17
        3:  Active  1  35 0.23
        4:  Active  1  49 0.30
        5:  Active  1  63 0.40
       ---                    
      253: Control 20 131 0.66
      254: Control 20 145 0.68
      255: Control 20 159 0.70
      256: Control 20 173 0.72
      257: Control 20 187 0.77
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_two_batches_verbose
    Output
      $summary_stats
                           outcome     arm  analysis     p25     p50     p75    mean
       1:    primary__hrqol_at_eof  Active       all   0.687   0.699   0.719   0.711
       2:    primary__hrqol_at_eof Control       all   0.552   0.562   0.571   0.555
       3:       primary__hrqol_auc  Active       all  84.709  85.195  88.546  86.678
       4:       primary__hrqol_auc Control       all  70.284  71.898  72.751  70.701
       5: secondary1__hrqol_at_eof  Active       all   0.687   0.699   0.719   0.711
       6: secondary1__hrqol_at_eof Control       all   0.552   0.562   0.571   0.555
       7:    secondary1__hrqol_auc  Active       all  83.537  84.004  87.289  85.580
       8:    secondary1__hrqol_auc Control       all  68.988  70.805  71.692  69.557
       9: secondary2__hrqol_at_eof  Active       all   0.687   0.699   0.719   0.711
      10: secondary2__hrqol_at_eof Control       all   0.552   0.562   0.571   0.555
      11:    secondary2__hrqol_auc  Active       all  78.387  79.654  82.048  80.874
      12:    secondary2__hrqol_auc Control       all  63.496  64.952  65.776  64.064
      13:    primary__hrqol_at_eof  Active survivors   0.764   0.784   0.795   0.781
      14:    primary__hrqol_at_eof Control survivors   0.608   0.629   0.636   0.622
      15:       primary__hrqol_auc  Active survivors  92.589  95.180  96.607  95.084
      16:       primary__hrqol_auc Control survivors  77.763  79.656  81.307  79.254
      17: secondary1__hrqol_at_eof  Active survivors   0.840   0.849   0.868   0.851
      18: secondary1__hrqol_at_eof Control survivors   0.641   0.668   0.685   0.664
      19:    secondary1__hrqol_auc  Active survivors 100.726 103.152 104.624 102.406
      20:    secondary1__hrqol_auc Control survivors  80.753  83.685  85.006  83.209
      21: secondary2__hrqol_at_eof  Active survivors   0.874   0.882   0.892   0.883
      22: secondary2__hrqol_at_eof Control survivors   0.699   0.705   0.708   0.703
      23:    secondary2__hrqol_auc  Active survivors  98.395 100.373 102.139 100.404
      24:    secondary2__hrqol_auc Control survivors  80.331  80.937  82.031  81.115
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.035 0.011
       2: 0.032 0.010
       3: 3.743 1.184
       4: 3.926 1.242
       5: 0.035 0.011
       6: 0.032 0.010
       7: 3.763 1.190
       8: 3.882 1.227
       9: 0.035 0.011
      10: 0.032 0.010
      11: 3.660 1.158
      12: 3.731 1.180
      13: 0.030 0.010
      14: 0.031 0.010
      15: 2.851 0.902
      16: 3.596 1.137
      17: 0.022 0.007
      18: 0.029 0.009
      19: 2.703 0.855
      20: 3.357 1.062
      21: 0.011 0.004
      22: 0.007 0.002
      23: 2.176 0.688
      24: 0.926 0.293
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.156                -0.158
       4:          mean_ground_truth                -0.167                -0.167
       5:                         sd                 0.036                 0.026
       6:                         se                 0.011                 0.008
       7:                   analysis                   all             survivors
       8:                       bias                 0.011                 0.009
       9:                    bias_se                 0.011                 0.008
      10:              relative_bias                -0.064                -0.053
      11:           relative_bias_se                 0.069                  0.05
      12:                        mse                 0.001                 0.001
      13:                     mse_se                     0                     0
      14:                   coverage                     1                     1
      15:                coverage_se                     0                     0
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.7                   0.9
      19:    rejection_proportion_se                 0.145                 0.095
      20:                      n_sim                    10                    10
      21:                        p25                -0.174                -0.165
      22:                        p50                 -0.15                -0.159
      23:                        p75                -0.132                -0.144
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.977             -15.83                   -0.156
       4:            -16.623            -16.623                   -0.167
       5:              4.195              2.901                    0.036
       6:              1.327              0.917                    0.011
       7:                all          survivors                      all
       8:              0.647              0.793                    0.011
       9:              1.327              0.917                    0.011
      10:             -0.039             -0.048                   -0.064
      11:               0.08              0.055                    0.069
      12:             16.257              8.205                    0.001
      13:              6.232              3.919                        0
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.3                0.7                      0.7
      19:              0.145              0.145                    0.145
      20:                 10                 10                       10
      21:            -18.209            -16.087                   -0.174
      22:            -14.248            -15.403                    -0.15
      23:            -13.537            -14.494                   -0.132
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.187               -16.023               -19.197
       4:                   -0.167               -16.842               -16.842
       5:                    0.034                 4.128                 4.441
       6:                    0.011                 1.306                 1.404
       7:                survivors                   all             survivors
       8:                    -0.02                 0.819                -2.355
       9:                    0.011                 1.306                 1.404
      10:                     0.12                -0.049                  0.14
      11:                    0.065                 0.078                 0.083
      12:                    0.001                 16.01                23.291
      13:                        0                 5.556                 7.685
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.3                     1
      19:                        0                 0.145                     0
      20:                       10                    10                    10
      21:                   -0.213               -18.329               -21.723
      22:                   -0.193               -14.477               -20.215
      23:                   -0.155               -13.622               -15.459
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.156                    -0.18                -16.81
       4:                   -0.167                   -0.167                 -18.6
       5:                    0.036                    0.014                 3.898
       6:                    0.011                    0.005                 1.233
       7:                      all                survivors                   all
       8:                    0.011                   -0.013                  1.79
       9:                    0.011                    0.005                 1.233
      10:                   -0.064                    0.079                -0.096
      11:                    0.069                    0.027                 0.066
      12:                    0.001                        0                16.882
      13:                        0                        0                 4.509
      14:                        1                        1                     1
      15:                        0                        0                     0
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.5
      19:                    0.145                        0                 0.158
      20:                       10                       10                    10
      21:                   -0.174                   -0.192               -18.189
      22:                    -0.15                    -0.18               -15.294
      23:                   -0.132                    -0.17               -14.155
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -19.289
       4:                 -18.6
       5:                 2.512
       6:                 0.794
       7:             survivors
       8:                 -0.69
       9:                 0.794
      10:                 0.037
      11:                 0.043
      12:                 6.153
      13:                 2.412
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:                -21.34
      22:                -18.49
      23:               -17.948
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
               arm id   x    y
        1:  Active  1   0 0.00
        2:  Active  1  21 0.17
        3:  Active  1  35 0.23
        4:  Active  1  49 0.30
        5:  Active  1  63 0.40
       ---                    
      253: Control 20 131 0.66
      254: Control 20 145 0.68
      255: Control 20 159 0.70
      256: Control 20 173 0.72
      257: Control 20 187 0.77
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_single_batch_without_examples
    Output
      $summary_stats
                           outcome     arm  analysis     p25     p50     p75    mean
       1:    primary__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       2:    primary__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       3:       primary__hrqol_auc  Active       all  84.259  89.061  89.441  87.080
       4:       primary__hrqol_auc Control       all  70.082  72.749  74.563  71.903
       5: secondary1__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       6: secondary1__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       7:    secondary1__hrqol_auc  Active       all  83.153  87.874  88.572  86.006
       8:    secondary1__hrqol_auc Control       all  68.887  71.466  73.355  70.705
       9: secondary2__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
      10: secondary2__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
      11:    secondary2__hrqol_auc  Active       all  78.088  82.286  83.530  80.903
      12:    secondary2__hrqol_auc Control       all  63.051  66.284  67.758  65.410
      13:    primary__hrqol_at_eof  Active survivors   0.754   0.781   0.833   0.794
      14:    primary__hrqol_at_eof Control survivors   0.602   0.620   0.637   0.617
      15:       primary__hrqol_auc  Active survivors  92.621  95.589 101.595  96.838
      16:       primary__hrqol_auc Control survivors  77.481  78.937  79.408  78.305
      17: secondary1__hrqol_at_eof  Active survivors   0.832   0.846   0.864   0.854
      18: secondary1__hrqol_at_eof Control survivors   0.650   0.666   0.673   0.662
      19:    secondary1__hrqol_auc  Active survivors 100.088 102.137 104.649 102.900
      20:    secondary1__hrqol_auc Control survivors  80.504  82.872  83.996  82.615
      21: secondary2__hrqol_at_eof  Active survivors   0.885   0.890   0.895   0.892
      22: secondary2__hrqol_at_eof Control survivors   0.684   0.698   0.704   0.693
      23:    secondary2__hrqol_auc  Active survivors 100.505 101.076 101.888 101.099
      24:    secondary2__hrqol_auc Control survivors  78.982  80.440  81.456  80.029
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.041 0.013
       2: 0.032 0.010
       3: 5.412 1.711
       4: 3.672 1.161
       5: 0.041 0.013
       6: 0.032 0.010
       7: 5.332 1.686
       8: 3.647 1.153
       9: 0.041 0.013
      10: 0.032 0.010
      11: 4.943 1.563
      12: 3.454 1.092
      13: 0.043 0.013
      14: 0.022 0.007
      15: 5.711 1.806
      16: 2.581 0.816
      17: 0.029 0.009
      18: 0.018 0.006
      19: 4.094 1.295
      20: 2.650 0.838
      21: 0.013 0.004
      22: 0.012 0.004
      23: 2.027 0.641
      24: 1.765 0.558
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.147                -0.176
       4:          mean_ground_truth                -0.165                -0.165
       5:                         sd                 0.056                 0.052
       6:                         se                 0.018                 0.017
       7:                   analysis                   all             survivors
       8:                       bias                 0.018                -0.011
       9:                    bias_se                 0.018                 0.017
      10:              relative_bias                 -0.11                 0.069
      11:           relative_bias_se                 0.107                   0.1
      12:                        mse                 0.003                 0.003
      13:                     mse_se                 0.001                 0.001
      14:                   coverage                     1                     1
      15:                coverage_se                     0                     0
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.7                     1
      19:    rejection_proportion_se                 0.145                     0
      20:                      n_sim                    10                    10
      21:                        p25                -0.179                -0.221
      22:                        p50                -0.147                -0.178
      23:                        p75                -0.123                -0.134
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.178            -18.533                   -0.147
       4:             -15.87             -15.87                   -0.165
       5:               7.39              6.543                    0.056
       6:              2.337              2.069                    0.018
       7:                all          survivors                      all
       8:              0.692             -2.664                    0.018
       9:              2.337              2.069                    0.018
      10:             -0.044              0.168                    -0.11
      11:              0.147               0.13                    0.107
      12:             49.625             45.623                    0.003
      13:              24.99             15.231                    0.001
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.5                0.6                      0.7
      19:              0.158              0.155                    0.145
      20:                 10                 10                       10
      21:            -19.528             -24.89                   -0.179
      22:            -15.033             -18.85                   -0.147
      23:            -13.098            -12.054                   -0.123
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.192               -15.301               -20.284
       4:                   -0.165               -16.043               -16.043
       5:                    0.022                 7.296                 3.311
       6:                    0.007                 2.307                 1.047
       7:                survivors                   all             survivors
       8:                   -0.027                 0.742                -4.241
       9:                    0.007                 2.307                 1.047
      10:                    0.162                -0.046                 0.264
      11:                    0.043                 0.144                 0.065
      12:                    0.001                48.464                27.852
      13:                        0                 23.96                 9.913
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.5                     1
      19:                        0                 0.158                     0
      20:                       10                    10                    10
      21:                   -0.207               -19.733               -22.491
      22:                   -0.184               -15.229                -19.83
      23:                   -0.178                -12.94               -18.861
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.147                   -0.199               -15.493
       4:                   -0.165                   -0.165               -19.106
       5:                    0.056                    0.017                 6.583
       6:                    0.018                    0.005                 2.082
       7:                      all                survivors                   all
       8:                    0.018                   -0.034                 3.613
       9:                    0.018                    0.005                 2.082
      10:                    -0.11                    0.203                -0.189
      11:                    0.107                    0.032                 0.109
      12:                    0.003                    0.001                52.048
      13:                    0.001                        0                26.483
      14:                        1                      0.7                   0.9
      15:                        0                    0.145                 0.095
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.5
      19:                    0.145                        0                 0.158
      20:                       10                       10                    10
      21:                   -0.179                   -0.208               -19.471
      22:                   -0.147                   -0.196               -15.855
      23:                   -0.123                   -0.188               -13.191
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:                -21.07
       4:               -19.106
       5:                 2.565
       6:                 0.811
       7:             survivors
       8:                -1.965
       9:                 0.811
      10:                 0.103
      11:                 0.042
      12:                 9.779
      13:                 4.745
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -22.463
      22:               -20.936
      23:               -19.416
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
         1:  Active                    NA                 NA                       NA
         2:  Active                  0.91          113.78288                     0.91
         3:  Active                    NA                 NA                       NA
         4:  Active                    NA                 NA                       NA
         5:  Active                  0.85          102.13590                     0.85
        ---                                                                          
       996: Control                  0.72           94.68755                     0.72
       997: Control                  0.00            4.20000                       NA
       998: Control                  0.64           79.43466                     0.64
       999: Control                  0.00            1.12000                       NA
      1000: Control                  0.00            2.56500                     0.00
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:                    NA                       NA                    NA
         2:             112.16219                     0.91             107.99493
         3:                    NA                       NA                    NA
         4:                    NA                       NA                    NA
         5:             100.93165                     0.85              97.64827
        ---                                                                     
       996:              93.18789                     0.72              87.24000
       997:                    NA                       NA                    NA
       998:              78.46539                     0.64              73.10000
       999:                    NA                       NA                    NA
      1000:               0.00000                       NA                    NA
            trial_id
         1:        9
         2:        3
         3:        8
         4:       10
         5:        2
        ---         
       996:        1
       997:        9
       998:       10
       999:        1
      1000:       10
      
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
                           outcome     arm  analysis     p25     p50     p75    mean
       1:    primary__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.710
       2:    primary__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
       3:       primary__hrqol_auc  Active       all  78.643  88.072  94.191  86.839
       4:       primary__hrqol_auc Control       all  69.357  70.864  74.126  71.678
       5: secondary1__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.710
       6: secondary1__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
       7:    secondary1__hrqol_auc  Active       all  77.781  86.991  92.943  85.758
       8:    secondary1__hrqol_auc Control       all  68.235  69.611  72.794  70.465
       9: secondary2__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.710
      10: secondary2__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
      11:    secondary2__hrqol_auc  Active       all  72.760  81.964  87.458  80.580
      12:    secondary2__hrqol_auc Control       all  63.024  63.878  67.196  65.019
      13:    primary__hrqol_at_eof  Active survivors   0.768   0.791   0.831   0.794
      14:    primary__hrqol_at_eof Control survivors   0.598   0.611   0.628   0.615
      15:       primary__hrqol_auc  Active survivors  94.062  96.765 101.104  97.206
      16:       primary__hrqol_auc Control survivors  76.822  78.090  79.542  78.081
      17: secondary1__hrqol_at_eof  Active survivors   0.837   0.856   0.871   0.850
      18: secondary1__hrqol_at_eof Control survivors   0.633   0.652   0.670   0.653
      19:    secondary1__hrqol_auc  Active survivors 100.437 103.698 104.857 102.732
      20:    secondary1__hrqol_auc Control survivors  79.090  81.270  83.475  81.460
      21: secondary2__hrqol_at_eof  Active survivors   0.880   0.885   0.893   0.889
      22: secondary2__hrqol_at_eof Control survivors   0.694   0.696   0.702   0.697
      23:    secondary2__hrqol_auc  Active survivors  99.781 100.214 101.439 100.940
      24:    secondary2__hrqol_auc Control survivors  79.757  80.063  81.015  80.306
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.074 0.023
       2: 0.032 0.010
       3: 9.125 2.885
       4: 4.140 1.309
       5: 0.074 0.023
       6: 0.032 0.010
       7: 9.055 2.863
       8: 4.043 1.279
       9: 0.074 0.023
      10: 0.032 0.010
      11: 8.664 2.740
      12: 3.863 1.222
      13: 0.043 0.014
      14: 0.021 0.007
      15: 5.665 1.791
      16: 2.775 0.877
      17: 0.036 0.011
      18: 0.027 0.009
      19: 4.610 1.458
      20: 4.103 1.298
      21: 0.014 0.004
      22: 0.020 0.006
      23: 2.083 0.659
      24: 2.751 0.870
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:              mean_estimate                -0.145                -0.179
       4:          mean_ground_truth                -0.052                -0.052
       5:                         sd                 0.077                 0.039
       6:                         se                 0.024                 0.012
       7:                   analysis                   all             survivors
       8:                       bias                -0.093                -0.127
       9:                    bias_se                 0.024                 0.012
      10:              relative_bias                 1.786                 2.443
      11:           relative_bias_se                 0.469                 0.234
      12:                        mse                 0.014                 0.017
      13:                     mse_se                 0.004                 0.003
      14:                   coverage                   0.6                   0.3
      15:                coverage_se                 0.155                 0.145
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                   0.6                   0.9
      19:    rejection_proportion_se                 0.155                 0.095
      20:                      n_sim                    10                    10
      21:                        p25                -0.191                  -0.2
      22:                        p50                 -0.17                -0.183
      23:                        p75                -0.075                -0.154
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:            -15.161            -19.125                   -0.145
       4:             -0.902             -0.902                   -0.052
       5:             10.045              5.674                    0.077
       6:              3.176              1.794                    0.024
       7:                all          survivors                      all
       8:             -14.26            -18.223                   -0.093
       9:              3.176              1.794                    0.024
      10:             15.811             20.207                    1.786
      11:              3.522               1.99                    0.469
      12:            294.144            361.068                    0.014
      13:             86.867             66.106                    0.004
      14:                0.4                0.3                      0.6
      15:              0.155              0.145                    0.155
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.6                0.7                      0.6
      19:              0.155              0.145                    0.155
      20:                 10                 10                       10
      21:            -22.002            -22.754                   -0.191
      22:            -18.841            -18.675                    -0.17
      23:             -5.535            -15.741                   -0.075
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.197               -15.293               -21.271
       4:                   -0.052                -1.722                -1.722
       5:                    0.057                 9.908                 7.682
       6:                    0.018                 3.133                 2.429
       7:                survivors                   all             survivors
       8:                   -0.145                -13.57               -19.549
       9:                    0.018                 3.133                 2.429
      10:                    2.797                 7.878                11.349
      11:                    0.344                 1.819                  1.41
      12:                    0.024               272.505               435.273
      13:                    0.004                81.543                 83.95
      14:                      0.1                   0.4                   0.1
      15:                    0.095                 0.155                 0.095
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                      0.9                   0.6                   0.9
      19:                    0.095                 0.155                 0.095
      20:                       10                    10                    10
      21:                   -0.233               -21.947               -24.859
      22:                    -0.19               -18.807               -20.513
      23:                   -0.186                -5.866               -19.382
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.145                   -0.192               -15.561
       4:                   -0.052                   -0.052                -5.527
       5:                    0.077                    0.023                  9.26
       6:                    0.024                    0.007                 2.928
       7:                      all                survivors                   all
       8:                   -0.093                    -0.14               -10.033
       9:                    0.024                    0.007                 2.928
      10:                    1.786                    2.685                 1.815
      11:                    0.469                     0.14                  0.53
      12:                    0.014                     0.02               177.843
      13:                    0.004                    0.002                54.993
      14:                      0.6                        0                   0.7
      15:                    0.155                        0                 0.145
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.6                        1                   0.6
      19:                    0.155                        0                 0.155
      20:                       10                       10                    10
      21:                   -0.191                   -0.201                -21.57
      22:                    -0.17                    -0.19               -18.994
      23:                   -0.075                   -0.186                -6.887
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.634
       4:                -5.527
       5:                 3.245
       6:                 1.026
       7:             survivors
       8:               -15.107
       9:                 1.026
      10:                 2.733
      11:                 0.186
      12:               237.704
      13:                29.454
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -22.635
      22:               -20.161
      23:               -19.551
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
         1:  Active                  0.87          104.83221                     0.87
         2:  Active                  0.87          104.83221                     0.87
         3:  Active                  0.92          114.03221                     0.92
         4:  Active                  0.92          114.03221                     0.92
         5:  Active                  0.92          114.03221                     0.92
        ---                                                                          
       996: Control                  0.67           73.86000                     0.67
       997: Control                  0.68           87.20755                     0.68
       998: Control                  0.00            1.84000                     0.00
       999: Control                  0.60           66.33937                     0.60
      1000: Control                  0.73           88.59705                     0.73
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:             103.83963                     0.87              96.84039
         2:             103.83963                     0.87              96.84039
         3:             112.63963                     0.92             103.89039
         4:             112.63963                     0.92             103.89039
         5:             112.63963                     0.92             103.89039
        ---                                                                     
       996:              74.71000                     0.67              79.75258
       997:              86.12789                     0.68              81.36000
       998:               0.00000                       NA                    NA
       999:              65.90685                     0.60              65.12625
      1000:              86.63845                     0.73              81.71326
            trial_id
         1:        8
         2:        2
         3:        1
         4:        8
         5:        1
        ---         
       996:        1
       997:        4
       998:        9
       999:        9
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
               arm id   x    y
        1:  Active  1   0 0.00
        2:  Active  1  21 0.26
        3:  Active  1  35 0.32
        4:  Active  1  49 0.39
        5:  Active  1  63 0.49
       ---                    
      237: Control 20 131 0.59
      238: Control 20 145 0.61
      239: Control 20 159 0.63
      240: Control 20 173 0.65
      241: Control 20 187 0.70
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

