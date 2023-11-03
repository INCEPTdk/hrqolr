# simulate_trials S3 method works

    Code
      sims_single_batch
    Output
      $summary_stats
                           outcome     arm  analysis     p25     p50     p75    mean
       1:    primary__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       2:    primary__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       3:       primary__hrqol_auc  Active       all  84.267  89.076  89.440  87.086
       4:       primary__hrqol_auc Control       all  70.139  72.803  74.618  71.962
       5: secondary1__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       6: secondary1__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       7:    secondary1__hrqol_auc  Active       all  83.135  87.849  88.547  85.978
       8:    secondary1__hrqol_auc Control       all  68.870  71.463  73.326  70.681
       9: secondary2__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
      10: secondary2__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
      11:    secondary2__hrqol_auc  Active       all  78.074  82.272  83.514  80.882
      12:    secondary2__hrqol_auc Control       all  63.112  66.344  67.827  65.468
      13:    primary__hrqol_at_eof  Active survivors   0.754   0.781   0.833   0.794
      14:    primary__hrqol_at_eof Control survivors   0.602   0.620   0.637   0.617
      15:       primary__hrqol_auc  Active survivors  92.634  95.596 101.581  96.845
      16:       primary__hrqol_auc Control survivors  77.539  79.005  79.466  78.370
      17: secondary1__hrqol_at_eof  Active survivors   0.832   0.846   0.864   0.854
      18: secondary1__hrqol_at_eof Control survivors   0.650   0.666   0.673   0.662
      19:    secondary1__hrqol_auc  Active survivors 100.052 102.104 104.605 102.867
      20:    secondary1__hrqol_auc Control survivors  80.450  82.840  83.970  82.588
      21: secondary2__hrqol_at_eof  Active survivors   0.885   0.890   0.895   0.892
      22: secondary2__hrqol_at_eof Control survivors   0.684   0.698   0.704   0.693
      23:    secondary2__hrqol_auc  Active survivors 100.479 101.038 101.874 101.072
      24:    secondary2__hrqol_auc Control survivors  79.046  80.519  81.541  80.100
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.041 0.013
       2: 0.032 0.010
       3: 5.407 1.710
       4: 3.665 1.159
       5: 0.041 0.013
       6: 0.032 0.010
       7: 5.327 1.685
       8: 3.641 1.151
       9: 0.041 0.013
      10: 0.032 0.010
      11: 4.939 1.562
      12: 3.461 1.094
      13: 0.043 0.013
      14: 0.022 0.007
      15: 5.707 1.805
      16: 2.572 0.813
      17: 0.029 0.009
      18: 0.018 0.006
      19: 4.095 1.295
      20: 2.660 0.841
      21: 0.013 0.004
      22: 0.012 0.004
      23: 2.024 0.640
      24: 1.770 0.560
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
       3:            -15.124            -18.475                   -0.147
       4:            -15.897            -15.897                   -0.165
       5:              7.377              6.532                    0.056
       6:              2.333              2.066                    0.018
       7:                all          survivors                      all
       8:              0.772             -2.579                    0.018
       9:              2.333              2.066                    0.018
      10:             -0.049              0.162                    -0.11
      11:              0.147               0.13                    0.107
      12:              49.58             45.053                    0.003
      13:             25.053             14.887                    0.001
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.5                0.6                      0.7
      19:              0.158              0.155                    0.145
      20:                 10                 10                       10
      21:            -19.485            -24.839                   -0.179
      22:            -14.994            -18.794                   -0.147
      23:            -13.042            -12.004                   -0.123
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.192               -15.298               -20.279
       4:                   -0.165               -16.027               -16.027
       5:                    0.022                 7.286                 3.301
       6:                    0.007                 2.304                 1.044
       7:                survivors                   all             survivors
       8:                   -0.027                 0.729                -4.253
       9:                    0.007                 2.304                 1.044
      10:                    0.162                -0.045                 0.265
      11:                    0.043                 0.144                 0.065
      12:                    0.001                48.309                27.889
      13:                        0                 23.89                 9.907
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.5                     1
      19:                        0                 0.158                     0
      20:                       10                    10                    10
      21:                   -0.207               -19.717               -22.494
      22:                   -0.184               -15.219                -19.81
      23:                   -0.178                -12.96               -18.856
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.147                   -0.199               -15.414
       4:                   -0.165                   -0.165               -18.976
       5:                    0.056                    0.017                 6.587
       6:                    0.018                    0.005                 2.083
       7:                      all                survivors                   all
       8:                    0.018                   -0.034                 3.563
       9:                    0.018                    0.005                 2.083
      10:                    -0.11                    0.203                -0.188
      11:                    0.107                    0.032                  0.11
      12:                    0.003                    0.001                51.744
      13:                    0.001                        0                26.329
      14:                        1                      0.7                   0.9
      15:                        0                    0.145                 0.095
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.5
      19:                    0.145                        0                 0.158
      20:                       10                       10                    10
      21:                   -0.179                   -0.208               -19.391
      22:                   -0.147                   -0.196               -15.776
      23:                   -0.123                   -0.188               -13.108
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.973
       4:               -18.976
       5:                 2.564
       6:                 0.811
       7:             survivors
       8:                -1.996
       9:                 0.811
      10:                 0.105
      11:                 0.043
      12:                 9.901
      13:                 4.779
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -22.373
      22:               -20.852
      23:               -19.316
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
         2:  Active                  0.91         113.723744                     0.91
         3:  Active                    NA                 NA                       NA
         4:  Active                    NA                 NA                       NA
         5:  Active                  0.85         101.957065                     0.85
        ---                                                                          
       996: Control                  0.72          95.030462                     0.72
       997: Control                  0.00           4.203257                       NA
       998: Control                  0.64          79.474663                     0.64
       999: Control                  0.00           1.120000                       NA
      1000: Control                  0.00           2.610699                     0.00
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:                    NA                       NA                    NA
         2:          112.04090469                     0.91             107.96475
         3:                    NA                       NA                    NA
         4:                    NA                       NA                    NA
         5:          100.88025280                     0.85              97.63740
        ---                                                                     
       996:           93.16949482                     0.72              87.13766
       997:                    NA                       NA                    NA
       998:           78.49365126                     0.64              73.22993
       999:                    NA                       NA                    NA
      1000:            0.02252362                       NA                    NA
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
               arm id   x     y
        1:  Active  1   0 0.000
        2:  Active  1  21 0.170
        3:  Active  1  35 0.232
        4:  Active  1  49 0.303
        5:  Active  1  63 0.397
       ---                     
      253: Control 20 131 0.659
      254: Control 20 145 0.679
      255: Control 20 159 0.700
      256: Control 20 173 0.723
      257: Control 20 187 0.770
      
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
       3:       primary__hrqol_auc  Active       all  84.689  85.167  88.547  86.669
       4:       primary__hrqol_auc Control       all  70.338  71.945  72.808  70.752
       5: secondary1__hrqol_at_eof  Active       all   0.687   0.699   0.719   0.711
       6: secondary1__hrqol_at_eof Control       all   0.552   0.562   0.571   0.555
       7:    secondary1__hrqol_auc  Active       all  83.502  83.965  87.260  85.544
       8:    secondary1__hrqol_auc Control       all  68.962  70.784  71.649  69.529
       9: secondary2__hrqol_at_eof  Active       all   0.687   0.699   0.719   0.711
      10: secondary2__hrqol_at_eof Control       all   0.552   0.562   0.571   0.555
      11:    secondary2__hrqol_auc  Active       all  78.374  79.616  82.027  80.850
      12:    secondary2__hrqol_auc Control       all  63.565  65.015  65.840  64.125
      13:    primary__hrqol_at_eof  Active survivors   0.764   0.784   0.795   0.781
      14:    primary__hrqol_at_eof Control survivors   0.608   0.629   0.636   0.622
      15:       primary__hrqol_auc  Active survivors  92.566  95.183  96.586  95.074
      16:       primary__hrqol_auc Control survivors  77.829  79.710  81.355  79.311
      17: secondary1__hrqol_at_eof  Active survivors   0.840   0.849   0.868   0.851
      18: secondary1__hrqol_at_eof Control survivors   0.641   0.668   0.685   0.664
      19:    secondary1__hrqol_auc  Active survivors 100.684 103.120 104.564 102.363
      20:    secondary1__hrqol_auc Control survivors  80.734  83.649  84.961  83.175
      21: secondary2__hrqol_at_eof  Active survivors   0.874   0.882   0.892   0.883
      22: secondary2__hrqol_at_eof Control survivors   0.699   0.705   0.708   0.703
      23:    secondary2__hrqol_auc  Active survivors  98.363 100.340 102.091 100.375
      24:    secondary2__hrqol_auc Control survivors  80.432  81.024  82.100  81.192
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.035 0.011
       2: 0.032 0.010
       3: 3.750 1.186
       4: 3.930 1.243
       5: 0.035 0.011
       6: 0.032 0.010
       7: 3.761 1.189
       8: 3.882 1.227
       9: 0.035 0.011
      10: 0.032 0.010
      11: 3.655 1.156
      12: 3.731 1.180
      13: 0.030 0.010
      14: 0.031 0.010
      15: 2.849 0.901
      16: 3.597 1.137
      17: 0.022 0.007
      18: 0.029 0.009
      19: 2.701 0.854
      20: 3.354 1.061
      21: 0.011 0.004
      22: 0.007 0.002
      23: 2.179 0.689
      24: 0.915 0.289
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
       3:            -15.917            -15.764                   -0.156
       4:             -16.63             -16.63                   -0.167
       5:              4.193              2.895                    0.036
       6:              1.326              0.915                    0.011
       7:                all          survivors                      all
       8:              0.713              0.867                    0.011
       9:              1.326              0.915                    0.011
      10:             -0.043             -0.052                   -0.064
      11:               0.08              0.055                    0.069
      12:              16.33              8.293                    0.001
      13:              6.108              3.832                        0
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.3                0.7                      0.7
      19:              0.145              0.145                    0.145
      20:                 10                 10                       10
      21:             -18.16            -16.032                   -0.174
      22:             -14.19            -15.347                    -0.15
      23:             -13.46            -14.424                   -0.132
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.187               -16.016               -19.188
       4:                   -0.167                -16.84                -16.84
       5:                    0.034                 4.125                 4.432
       6:                    0.011                 1.304                 1.401
       7:                survivors                   all             survivors
       8:                    -0.02                 0.824                -2.348
       9:                    0.011                 1.304                 1.401
      10:                     0.12                -0.049                 0.139
      11:                    0.065                 0.077                 0.083
      12:                    0.001                15.994                23.187
      13:                        0                 5.535                 7.635
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.3                     1
      19:                        0                 0.145                     0
      20:                       10                    10                    10
      21:                   -0.213               -18.327               -21.711
      22:                   -0.193               -14.476               -20.204
      23:                   -0.155                -13.61               -15.474
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.156                    -0.18               -16.725
       4:                   -0.167                   -0.167               -18.481
       5:                    0.036                    0.014                 3.899
       6:                    0.011                    0.005                 1.233
       7:                      all                survivors                   all
       8:                    0.011                   -0.013                 1.756
       9:                    0.011                    0.005                 1.233
      10:                   -0.064                    0.079                -0.095
      11:                    0.069                    0.027                 0.067
      12:                    0.001                        0                16.765
      13:                        0                        0                 4.516
      14:                        1                        1                     1
      15:                        0                        0                     0
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.4
      19:                    0.145                        0                 0.155
      20:                       10                       10                    10
      21:                   -0.174                   -0.192               -18.115
      22:                    -0.15                    -0.18               -15.187
      23:                   -0.132                    -0.17               -14.063
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -19.182
       4:               -18.481
       5:                 2.508
       6:                 0.793
       7:             survivors
       8:                -0.702
       9:                 0.793
      10:                 0.038
      11:                 0.043
      12:                 6.155
      13:                 2.439
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -21.191
      22:               -18.388
      23:               -17.831
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
               arm id   x     y
        1:  Active  1   0 0.000
        2:  Active  1  21 0.170
        3:  Active  1  35 0.232
        4:  Active  1  49 0.303
        5:  Active  1  63 0.397
       ---                     
      253: Control 20 131 0.659
      254: Control 20 145 0.679
      255: Control 20 159 0.700
      256: Control 20 173 0.723
      257: Control 20 187 0.770
      
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
       3:       primary__hrqol_auc  Active       all  84.267  89.076  89.440  87.086
       4:       primary__hrqol_auc Control       all  70.139  72.803  74.618  71.962
       5: secondary1__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
       6: secondary1__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
       7:    secondary1__hrqol_auc  Active       all  83.135  87.849  88.547  85.978
       8:    secondary1__hrqol_auc Control       all  68.870  71.463  73.326  70.681
       9: secondary2__hrqol_at_eof  Active       all   0.686   0.730   0.737   0.714
      10: secondary2__hrqol_at_eof Control       all   0.546   0.575   0.586   0.567
      11:    secondary2__hrqol_auc  Active       all  78.074  82.272  83.514  80.882
      12:    secondary2__hrqol_auc Control       all  63.112  66.344  67.827  65.468
      13:    primary__hrqol_at_eof  Active survivors   0.754   0.781   0.833   0.794
      14:    primary__hrqol_at_eof Control survivors   0.602   0.620   0.637   0.617
      15:       primary__hrqol_auc  Active survivors  92.634  95.596 101.581  96.845
      16:       primary__hrqol_auc Control survivors  77.539  79.005  79.466  78.370
      17: secondary1__hrqol_at_eof  Active survivors   0.832   0.846   0.864   0.854
      18: secondary1__hrqol_at_eof Control survivors   0.650   0.666   0.673   0.662
      19:    secondary1__hrqol_auc  Active survivors 100.052 102.104 104.605 102.867
      20:    secondary1__hrqol_auc Control survivors  80.450  82.840  83.970  82.588
      21: secondary2__hrqol_at_eof  Active survivors   0.885   0.890   0.895   0.892
      22: secondary2__hrqol_at_eof Control survivors   0.684   0.698   0.704   0.693
      23:    secondary2__hrqol_auc  Active survivors 100.479 101.038 101.874 101.072
      24:    secondary2__hrqol_auc Control survivors  79.046  80.519  81.541  80.100
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.041 0.013
       2: 0.032 0.010
       3: 5.407 1.710
       4: 3.665 1.159
       5: 0.041 0.013
       6: 0.032 0.010
       7: 5.327 1.685
       8: 3.641 1.151
       9: 0.041 0.013
      10: 0.032 0.010
      11: 4.939 1.562
      12: 3.461 1.094
      13: 0.043 0.013
      14: 0.022 0.007
      15: 5.707 1.805
      16: 2.572 0.813
      17: 0.029 0.009
      18: 0.018 0.006
      19: 4.095 1.295
      20: 2.660 0.841
      21: 0.013 0.004
      22: 0.012 0.004
      23: 2.024 0.640
      24: 1.770 0.560
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
       3:            -15.124            -18.475                   -0.147
       4:            -15.897            -15.897                   -0.165
       5:              7.377              6.532                    0.056
       6:              2.333              2.066                    0.018
       7:                all          survivors                      all
       8:              0.772             -2.579                    0.018
       9:              2.333              2.066                    0.018
      10:             -0.049              0.162                    -0.11
      11:              0.147               0.13                    0.107
      12:              49.58             45.053                    0.003
      13:             25.053             14.887                    0.001
      14:                  1                  1                        1
      15:                  0                  0                        0
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.5                0.6                      0.7
      19:              0.158              0.155                    0.145
      20:                 10                 10                       10
      21:            -19.485            -24.839                   -0.179
      22:            -14.994            -18.794                   -0.147
      23:            -13.042            -12.004                   -0.123
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.192               -15.298               -20.279
       4:                   -0.165               -16.027               -16.027
       5:                    0.022                 7.286                 3.301
       6:                    0.007                 2.304                 1.044
       7:                survivors                   all             survivors
       8:                   -0.027                 0.729                -4.253
       9:                    0.007                 2.304                 1.044
      10:                    0.162                -0.045                 0.265
      11:                    0.043                 0.144                 0.065
      12:                    0.001                48.309                27.889
      13:                        0                 23.89                 9.907
      14:                        1                     1                     1
      15:                        0                     0                     0
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.5                     1
      19:                        0                 0.158                     0
      20:                       10                    10                    10
      21:                   -0.207               -19.717               -22.494
      22:                   -0.184               -15.219                -19.81
      23:                   -0.178                -12.96               -18.856
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.147                   -0.199               -15.414
       4:                   -0.165                   -0.165               -18.976
       5:                    0.056                    0.017                 6.587
       6:                    0.018                    0.005                 2.083
       7:                      all                survivors                   all
       8:                    0.018                   -0.034                 3.563
       9:                    0.018                    0.005                 2.083
      10:                    -0.11                    0.203                -0.188
      11:                    0.107                    0.032                  0.11
      12:                    0.003                    0.001                51.744
      13:                    0.001                        0                26.329
      14:                        1                      0.7                   0.9
      15:                        0                    0.145                 0.095
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.7                        1                   0.5
      19:                    0.145                        0                 0.158
      20:                       10                       10                    10
      21:                   -0.179                   -0.208               -19.391
      22:                   -0.147                   -0.196               -15.776
      23:                   -0.123                   -0.188               -13.108
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.973
       4:               -18.976
       5:                 2.564
       6:                 0.811
       7:             survivors
       8:                -1.996
       9:                 0.811
      10:                 0.105
      11:                 0.043
      12:                 9.901
      13:                 4.779
      14:                     1
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:               -22.373
      22:               -20.852
      23:               -19.316
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
         2:  Active                  0.91         113.723744                     0.91
         3:  Active                    NA                 NA                       NA
         4:  Active                    NA                 NA                       NA
         5:  Active                  0.85         101.957065                     0.85
        ---                                                                          
       996: Control                  0.72          95.030462                     0.72
       997: Control                  0.00           4.203257                       NA
       998: Control                  0.64          79.474663                     0.64
       999: Control                  0.00           1.120000                       NA
      1000: Control                  0.00           2.610699                     0.00
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:                    NA                       NA                    NA
         2:          112.04090469                     0.91             107.96475
         3:                    NA                       NA                    NA
         4:                    NA                       NA                    NA
         5:          100.88025280                     0.85              97.63740
        ---                                                                     
       996:           93.16949482                     0.72              87.13766
       997:                    NA                       NA                    NA
       998:           78.49365126                     0.64              73.22993
       999:                    NA                       NA                    NA
      1000:            0.02252362                       NA                    NA
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
       1:    primary__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.709
       2:    primary__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
       3:       primary__hrqol_auc  Active       all  78.642  88.078  94.198  86.845
       4:       primary__hrqol_auc Control       all  69.405  70.895  74.192  71.722
       5: secondary1__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.709
       6: secondary1__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
       7:    secondary1__hrqol_auc  Active       all  77.758  86.960  92.918  85.729
       8:    secondary1__hrqol_auc Control       all  68.238  69.590  72.781  70.454
       9: secondary2__hrqol_at_eof  Active       all   0.645   0.720   0.763   0.709
      10: secondary2__hrqol_at_eof Control       all   0.546   0.555   0.583   0.565
      11:    secondary2__hrqol_auc  Active       all  72.744  81.933  87.453  80.564
      12:    secondary2__hrqol_auc Control       all  63.078  63.929  67.257  65.079
      13:    primary__hrqol_at_eof  Active survivors   0.768   0.791   0.831   0.794
      14:    primary__hrqol_at_eof Control survivors   0.598   0.611   0.628   0.615
      15:       primary__hrqol_auc  Active survivors  94.061  96.771 101.122  97.212
      16:       primary__hrqol_auc Control survivors  76.862  78.141  79.595  78.129
      17: secondary1__hrqol_at_eof  Active survivors   0.837   0.856   0.871   0.850
      18: secondary1__hrqol_at_eof Control survivors   0.633   0.652   0.670   0.653
      19:    secondary1__hrqol_auc  Active survivors 100.408 103.664 104.820 102.698
      20:    secondary1__hrqol_auc Control survivors  79.101  81.253  83.464  81.447
      21: secondary2__hrqol_at_eof  Active survivors   0.880   0.885   0.893   0.889
      22: secondary2__hrqol_at_eof Control survivors   0.694   0.696   0.702   0.697
      23:    secondary2__hrqol_auc  Active survivors  99.750 100.196 101.412 100.920
      24:    secondary2__hrqol_auc Control survivors  79.838  80.140  81.082  80.379
                           outcome     arm  analysis     p25     p50     p75    mean
             sd    se
       1: 0.074 0.023
       2: 0.032 0.010
       3: 9.130 2.887
       4: 4.148 1.312
       5: 0.074 0.023
       6: 0.032 0.010
       7: 9.049 2.862
       8: 4.042 1.278
       9: 0.074 0.023
      10: 0.032 0.010
      11: 8.658 2.738
      12: 3.861 1.221
      13: 0.043 0.014
      14: 0.021 0.007
      15: 5.670 1.793
      16: 2.789 0.882
      17: 0.036 0.011
      18: 0.027 0.009
      19: 4.605 1.456
      20: 4.096 1.295
      21: 0.014 0.004
      22: 0.020 0.006
      23: 2.080 0.658
      24: 2.747 0.869
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
       3:            -15.123            -19.083                   -0.145
       4:             -0.858             -0.858                   -0.052
       5:             10.049               5.68                    0.077
       6:              3.178              1.796                    0.024
       7:                all          survivors                      all
       8:            -14.265            -18.225                   -0.093
       9:              3.178              1.796                    0.024
      10:             16.625              21.24                    1.786
      11:              3.704              2.093                    0.469
      12:            294.365            361.178                    0.014
      13:              86.94             66.173                    0.004
      14:                0.4                0.3                      0.6
      15:              0.155              0.145                    0.155
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.6                0.7                      0.6
      19:              0.155              0.145                    0.155
      20:                 10                 10                       10
      21:            -21.967            -22.719                   -0.191
      22:            -18.797            -18.631                    -0.17
      23:             -5.495            -15.683                   -0.075
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                   -0.197               -15.276               -21.251
       4:                   -0.052                -1.703                -1.703
       5:                    0.057                 9.899                 7.667
       6:                    0.018                  3.13                 2.425
       7:                survivors                   all             survivors
       8:                   -0.145               -13.573               -19.548
       9:                    0.018                  3.13                 2.425
      10:                    2.797                 7.972                11.481
      11:                    0.344                 1.839                 1.424
      12:                    0.024               272.424               435.047
      13:                    0.004                81.481                83.801
      14:                      0.1                   0.4                   0.1
      15:                    0.095                 0.155                 0.095
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                      0.9                   0.6                   0.9
      19:                    0.095                 0.155                 0.095
      20:                       10                    10                    10
      21:                   -0.233               -21.917               -24.833
      22:                    -0.19               -18.779               -20.489
      23:                   -0.186                -5.874               -19.387
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                   -0.145                   -0.192               -15.485
       4:                   -0.052                   -0.052                 -5.43
       5:                    0.077                    0.023                 9.253
       6:                    0.024                    0.007                 2.926
       7:                      all                survivors                   all
       8:                   -0.093                    -0.14               -10.055
       9:                    0.024                    0.007                 2.926
      10:                    1.786                    2.685                 1.852
      11:                    0.469                     0.14                 0.539
      12:                    0.014                     0.02               178.166
      13:                    0.004                    0.002                55.068
      14:                      0.6                        0                   0.7
      15:                    0.155                        0                 0.145
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                      0.6                        1                   0.6
      19:                    0.155                        0                 0.155
      20:                       10                       10                    10
      21:                   -0.191                   -0.201               -21.489
      22:                    -0.17                    -0.19               -18.918
      23:                   -0.075                   -0.186                -6.845
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:               -20.541
       4:                 -5.43
       5:                 3.235
       6:                 1.023
       7:             survivors
       8:               -15.111
       9:                 1.023
      10:                 2.783
      11:                 0.188
      12:               237.776
      13:                29.425
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                    10
      21:                -22.55
      22:               -20.058
      23:               -19.448
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
         1:  Active                  0.87         104.975117                     0.87
         2:  Active                  0.87         104.975117                     0.87
         3:  Active                  0.92         114.175117                     0.92
         4:  Active                  0.92         114.175117                     0.92
         5:  Active                  0.92         114.175117                     0.92
        ---                                                                          
       996: Control                  0.67          73.799788                     0.67
       997: Control                  0.68          87.550462                     0.68
       998: Control                  0.00           1.857978                     0.00
       999: Control                  0.60          66.475788                     0.60
      1000: Control                  0.73          88.648178                     0.73
            secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_auc
         1:           103.8708008                     0.87              96.87044
         2:           103.8708008                     0.87              96.87044
         3:           112.6708008                     0.92             103.92044
         4:           112.6708008                     0.92             103.92044
         5:           112.6708008                     0.92             103.92044
        ---                                                                     
       996:            74.4578453                     0.67              79.67113
       997:            86.1094948                     0.68              81.25766
       998:             0.0395544                       NA                    NA
       999:            66.0010475                     0.60              65.02457
      1000:            86.5856833                     0.73              81.67838
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
               arm id   x     y
        1:  Active  1   0 0.000
        2:  Active  1  21 0.260
        3:  Active  1  35 0.322
        4:  Active  1  49 0.393
        5:  Active  1  63 0.487
       ---                     
      237: Control 20 131 0.589
      238: Control 20 145 0.609
      239: Control 20 159 0.630
      240: Control 20 173 0.653
      241: Control 20 187 0.700
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

