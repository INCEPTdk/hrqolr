# simulate_trials S3 method works

    Code
      sims_single_batch
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50    p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.555
       2:    primary__hrqol_at_eof Control       all  0.380  0.400  0.410  0.396
       3:       primary__hrqol_auc  Active       all 54.974 57.477 60.469 57.422
       4:       primary__hrqol_auc Control       all 39.574 41.947 43.481 41.619
       5: secondary1__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.555
       6: secondary1__hrqol_at_eof Control       all  0.380  0.400  0.410  0.396
       7:    secondary1__hrqol_auc  Active       all 55.366 58.054 60.951 57.819
       8:    secondary1__hrqol_auc Control       all 39.901 42.277 43.762 41.954
       9: secondary2__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.555
      10: secondary2__hrqol_at_eof Control       all  0.380  0.400  0.410  0.396
      11:    secondary2__hrqol_auc  Active       all 55.342 58.273 61.139 57.928
      12:    secondary2__hrqol_auc Control       all 39.682 41.972 43.319 41.612
      13:    primary__hrqol_at_eof  Active survivors  0.597  0.620  0.640  0.615
      14:    primary__hrqol_at_eof Control survivors  0.420  0.436  0.453  0.436
      15:       primary__hrqol_auc  Active survivors 61.383 63.906 66.546 63.628
      16:       primary__hrqol_auc Control survivors 44.222 45.989 47.219 45.745
      17: secondary1__hrqol_at_eof  Active survivors  0.647  0.665  0.682  0.660
      18: secondary1__hrqol_at_eof Control survivors  0.460  0.474  0.477  0.469
      19:    secondary1__hrqol_auc  Active survivors 67.418 69.268 70.484 68.815
      20:    secondary1__hrqol_auc Control survivors 48.631 49.850 50.841 49.666
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.699
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.498
      23:    secondary2__hrqol_auc  Active survivors 72.808 73.084 73.275 72.932
      24:    secondary2__hrqol_auc Control survivors 52.208 52.467 52.608 52.306
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.039 0.004
       2: 0.027 0.003
       3: 4.039 0.404
       4: 2.868 0.287
       5: 0.039 0.004
       6: 0.027 0.003
       7: 4.064 0.406
       8: 2.879 0.288
       9: 0.039 0.004
      10: 0.027 0.003
      11: 4.067 0.407
      12: 2.811 0.281
      13: 0.038 0.004
      14: 0.023 0.002
      15: 3.898 0.390
      16: 2.433 0.243
      17: 0.026 0.003
      18: 0.017 0.002
      19: 2.706 0.271
      20: 1.891 0.189
      21: 0.006 0.001
      22: 0.005 0.000
      23: 0.660 0.066
      24: 0.513 0.051
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.158                -0.179
       5:          mean_ground_truth                 -0.06                 -0.06
       6:                         sd                 0.052                 0.046
       7:                         se                 0.005                 0.005
       8:                       bias                -0.098                -0.119
       9:                    bias_se                 0.005                 0.005
      10:              relative_bias                 1.639                 1.983
      11:           relative_bias_se                 0.086                 0.076
      12:                        mse                 0.012                 0.016
      13:                     mse_se                 0.001                 0.001
      14:                   coverage                  0.43                  0.21
      15:                coverage_se                  0.05                 0.041
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.84                  0.94
      19:    rejection_proportion_se                 0.037                 0.024
      20:                      n_sim                   100                   100
      21:                        p25                 -0.19                 -0.21
      22:                        p50                -0.164                -0.179
      23:                        p75                -0.121                -0.153
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -15.803            -17.882                   -0.158
       5:             -4.993             -4.993                    -0.06
       6:              5.335              4.726                    0.052
       7:              0.533              0.473                    0.005
       8:            -10.809            -12.889                   -0.098
       9:              0.533              0.473                    0.005
      10:              2.165              2.581                    1.639
      11:              0.107              0.095                    0.086
      12:            145.015            188.233                    0.012
      13:             12.468             12.116                    0.001
      14:                0.4                0.2                     0.43
      15:              0.049               0.04                     0.05
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.81               0.94                     0.84
      19:              0.039              0.024                    0.037
      20:                100                100                      100
      21:            -18.968            -21.215                    -0.19
      22:            -16.076            -17.724                   -0.164
      23:            -12.377            -14.999                   -0.121
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.191               -15.866               -19.149
       5:                    -0.06                 -5.24                 -5.24
       6:                    0.032                 5.385                 3.372
       7:                    0.003                 0.539                 0.337
       8:                   -0.131               -10.626               -13.909
       9:                    0.003                 0.539                 0.337
      10:                    2.183                 2.028                 2.655
      11:                    0.054                 0.103                 0.064
      12:                    0.018               141.625                204.73
      13:                    0.001                12.473                 9.648
      14:                     0.06                  0.43                  0.05
      15:                    0.024                  0.05                 0.022
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.8                  0.99
      19:                        0                  0.04                  0.01
      20:                      100                   100                   100
      21:                   -0.212               -19.028               -21.244
      22:                   -0.188               -16.161               -18.776
      23:                   -0.175               -12.275               -17.104
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.158                     -0.2               -16.316
       5:                    -0.06                    -0.06                -7.581
       6:                    0.052                    0.006                 5.424
       7:                    0.005                    0.001                 0.542
       8:                   -0.098                    -0.14                -8.735
       9:                    0.005                    0.001                 0.542
      10:                    1.639                    2.336                 1.152
      11:                    0.086                    0.011                 0.072
      12:                    0.012                     0.02               105.434
      13:                    0.001                        0                10.545
      14:                     0.43                        0                  0.59
      15:                     0.05                        0                 0.049
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.84                        1                  0.82
      19:                    0.037                        0                 0.038
      20:                      100                      100                   100
      21:                    -0.19                     -0.2               -19.499
      22:                   -0.164                     -0.2               -16.692
      23:                   -0.121                     -0.2               -12.584
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -20.626
       5:                -7.581
       6:                 0.775
       7:                 0.077
       8:               -13.045
       9:                 0.077
      10:                 1.721
      11:                  0.01
      12:               170.753
      13:                 1.908
      14:                     0
      15:                     0
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -20.963
      22:               -20.622
      23:               -20.385
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
      [1] 100
      
      $args$n_patients_ground_truth
      [1] 10
      
      $args$n_example_trajectories_per_arm
      [1] 1000
      
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
                 arm primary__hrqol_at_eof primary__hrqol_auc
          1:  Active                   0.7           73.69512
          2:  Active                   0.7           73.69512
          3:  Active                   0.7           73.69512
          4:  Active                   0.7           73.69512
          5:  Active                   0.7           73.69512
         ---                                                 
       9996: Control                    NA                 NA
       9997: Control                    NA                 NA
       9998: Control                   0.0            0.00000
       9999: Control                    NA                 NA
      10000: Control                   0.0            0.00000
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
          1:                      0.7               73.9508                      0.7
          2:                      0.7               73.9508                      0.7
          3:                      0.7               73.9508                      0.7
          4:                      0.7               73.9508                      0.7
          5:                      0.7               73.9508                      0.7
         ---                                                                        
       9996:                       NA                    NA                       NA
       9997:                       NA                    NA                       NA
       9998:                       NA                    NA                       NA
       9999:                       NA                    NA                       NA
      10000:                      0.0                0.0000                       NA
             secondary2__hrqol_auc trial_id
          1:              72.90044       21
          2:              72.90044       46
          3:              72.90044       87
          4:              72.90044       30
          5:              72.90044       35
         ---                               
       9996:                    NA       84
       9997:                    NA       97
       9998:                    NA       54
       9999:                    NA       37
      10000:                    NA       57
      
      $example_trajectories
      $arm_level
               arm      x        y
        1:  Active   0.00 0.000000
        2:  Active   5.00 0.000000
        3:  Active   5.01 0.000674
        4:  Active   5.02 0.001348
        5:  Active   5.04 0.002024
       ---                        
      594: Control 186.60 0.493266
      595: Control 186.76 0.494949
      596: Control 186.88 0.496633
      597: Control 186.96 0.498316
      598: Control 187.00 0.500000
      
      $patient_level
                 arm   id   x      y
          1:  Active    1   0 0.0000
          2:  Active    1  21 0.0000
          3:  Active    1  35 0.0621
          4:  Active    1  49 0.1334
          5:  Active    1  63 0.2271
         ---                        
      24830: Control 1999 156 0.4277
      24831: Control 1999 170 0.4518
      24832: Control 1999 184 0.5000
      24833: Control 2000   0 0.0000
      24834: Control 2000   4     NA
      
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
       1:    primary__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.560
       2:    primary__hrqol_at_eof Control       all  0.380  0.400  0.420  0.399
       3:       primary__hrqol_auc  Active       all 54.971 57.913 60.806 57.793
       4:       primary__hrqol_auc Control       all 39.924 42.084 43.871 41.892
       5: secondary1__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.560
       6: secondary1__hrqol_at_eof Control       all  0.380  0.400  0.420  0.399
       7:    secondary1__hrqol_auc  Active       all 55.349 58.359 61.236 58.230
       8:    secondary1__hrqol_auc Control       all 40.304 42.373 44.280 42.240
       9: secondary2__hrqol_at_eof  Active       all  0.532  0.560  0.588  0.560
      10: secondary2__hrqol_at_eof Control       all  0.380  0.400  0.420  0.400
      11:    secondary2__hrqol_auc  Active       all 55.483 58.451 61.479 58.367
      12:    secondary2__hrqol_auc Control       all 39.957 41.980 43.949 41.890
      13:    primary__hrqol_at_eof  Active survivors  0.593  0.620  0.640  0.617
      14:    primary__hrqol_at_eof Control survivors  0.426  0.442  0.457  0.440
      15:       primary__hrqol_auc  Active survivors 61.311 63.691 66.456 63.758
      16:       primary__hrqol_auc Control survivors 44.620 46.283 47.860 46.166
      17: secondary1__hrqol_at_eof  Active survivors  0.647  0.666  0.683  0.662
      18: secondary1__hrqol_at_eof Control survivors  0.462  0.476  0.488  0.472
      19:    secondary1__hrqol_auc  Active survivors 67.334 69.192 70.813 68.914
      20:    secondary1__hrqol_auc Control survivors 48.801 50.168 51.516 49.951
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.499
      23:    secondary2__hrqol_auc  Active survivors 72.692 72.972 73.229 72.838
      24:    secondary2__hrqol_auc Control survivors 52.201 52.405 52.573 52.280
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.041 0.002
       2: 0.028 0.001
       3: 4.223 0.189
       4: 2.984 0.133
       5: 0.041 0.002
       6: 0.028 0.001
       7: 4.253 0.190
       8: 3.001 0.134
       9: 0.041 0.002
      10: 0.028 0.001
      11: 4.286 0.192
      12: 2.952 0.132
      13: 0.034 0.002
      14: 0.024 0.001
      15: 3.520 0.157
      16: 2.519 0.113
      17: 0.023 0.001
      18: 0.018 0.001
      19: 2.418 0.108
      20: 1.935 0.087
      21: 0.005 0.000
      22: 0.004 0.000
      23: 0.642 0.029
      24: 0.486 0.022
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                 -0.16                -0.177
       5:          mean_ground_truth                -0.175                -0.175
       6:                         sd                 0.048                 0.042
       7:                         se                 0.002                 0.002
       8:                       bias                 0.015                -0.002
       9:                    bias_se                 0.002                 0.002
      10:              relative_bias                -0.085                 0.012
      11:           relative_bias_se                 0.012                 0.011
      12:                        mse                 0.003                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.95                  0.95
      15:                coverage_se                  0.01                  0.01
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                 0.868                 0.972
      19:    rejection_proportion_se                 0.015                 0.007
      20:                      n_sim                   500                   500
      21:                        p25                -0.196                -0.205
      22:                        p50                -0.164                 -0.18
      23:                        p75                -0.126                -0.148
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -15.901            -17.591                    -0.16
       5:            -17.736            -17.736                   -0.175
       6:              5.061               4.39                    0.048
       7:              0.226              0.196                    0.002
       8:              1.835              0.145                    0.015
       9:              0.226              0.196                    0.002
      10:             -0.103             -0.008                   -0.085
      11:              0.013              0.011                    0.012
      12:             28.935             19.252                    0.003
      13:              1.783              1.125                        0
      14:              0.944              0.942                     0.95
      15:               0.01               0.01                     0.01
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:              0.826              0.964                    0.868
      19:              0.017              0.008                    0.015
      20:                500                500                      500
      21:            -19.597            -20.686                   -0.196
      22:            -16.375            -17.747                   -0.164
      23:            -12.322            -14.676                   -0.126
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                    -0.19                -15.99               -18.963
       5:                   -0.175               -17.815               -17.815
       6:                    0.029                 5.086                 3.118
       7:                    0.001                 0.227                 0.139
       8:                   -0.015                 1.825                -1.148
       9:                    0.001                 0.227                 0.139
      10:                    0.085                -0.102                 0.064
      11:                    0.008                 0.013                 0.008
      12:                    0.001                29.145                11.021
      13:                        0                 1.781                 0.625
      14:                    0.866                 0.944                 0.888
      15:                    0.015                  0.01                 0.014
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                 0.828                     1
      19:                        0                 0.017                     0
      20:                      500                   500                   500
      21:                    -0.21               -19.685               -21.096
      22:                   -0.191               -16.447               -18.931
      23:                   -0.168               -12.342               -16.776
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                    -0.16                     -0.2               -16.477
       5:                   -0.175                   -0.175               -18.144
       6:                    0.048                    0.007                 5.076
       7:                    0.002                        0                 0.227
       8:                    0.015                   -0.025                 1.667
       9:                    0.002                        0                 0.227
      10:                   -0.085                    0.142                -0.092
      11:                    0.012                    0.002                 0.013
      12:                    0.003                    0.001                28.497
      13:                        0                        0                 1.735
      14:                     0.95                    0.084                 0.942
      15:                     0.01                    0.012                  0.01
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                    0.868                        1                 0.856
      19:                    0.015                        0                 0.016
      20:                      500                      500                   500
      21:                   -0.194                     -0.2               -20.063
      22:                   -0.164                     -0.2               -17.058
      23:                   -0.126                     -0.2               -12.893
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -20.558
       5:               -18.144
       6:                 0.801
       7:                 0.036
       8:                -2.414
       9:                 0.036
      10:                 0.133
      11:                 0.002
      12:                 6.467
      13:                 0.165
      14:                 0.102
      15:                 0.014
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   500
      21:               -20.954
      22:                 -20.6
      23:               -20.251
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
      [1] 500
      
      $args$n_patients_ground_truth
      [1] 1000
      
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
       1:    primary__hrqol_at_eof  Active       all  0.518  0.546  0.588  0.551
       2:    primary__hrqol_at_eof Control       all  0.380  0.400  0.420  0.397
       3:       primary__hrqol_auc  Active       all 53.277 56.670 60.614 56.905
       4:       primary__hrqol_auc Control       all 39.535 41.468 43.918 41.675
       5: secondary1__hrqol_at_eof  Active       all  0.518  0.546  0.588  0.551
       6: secondary1__hrqol_at_eof Control       all  0.380  0.400  0.420  0.397
       7:    secondary1__hrqol_auc  Active       all 53.745 57.054 61.041 57.320
       8:    secondary1__hrqol_auc Control       all 39.874 41.771 44.320 42.002
       9: secondary2__hrqol_at_eof  Active       all  0.518  0.546  0.588  0.551
      10: secondary2__hrqol_at_eof Control       all  0.380  0.400  0.420  0.397
      11:    secondary2__hrqol_auc  Active       all 53.946 57.096 61.600 57.501
      12:    secondary2__hrqol_auc Control       all 39.821 41.722 43.973 41.714
      13:    primary__hrqol_at_eof  Active survivors  0.583  0.619  0.640  0.611
      14:    primary__hrqol_at_eof Control survivors  0.422  0.441  0.455  0.438
      15:       primary__hrqol_auc  Active survivors 60.124 63.494 66.223 63.084
      16:       primary__hrqol_auc Control survivors 43.984 46.183 47.761 45.954
      17: secondary1__hrqol_at_eof  Active survivors  0.639  0.664  0.670  0.656
      18: secondary1__hrqol_at_eof Control survivors  0.461  0.475  0.488  0.472
      19:    secondary1__hrqol_auc  Active survivors 66.461 68.719 69.993 68.207
      20:    secondary1__hrqol_auc Control survivors 48.405 49.942 51.490 49.865
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.499
      23:    secondary2__hrqol_auc  Active survivors 72.675 73.037 73.258 72.836
      24:    secondary2__hrqol_auc Control survivors 52.267 52.446 52.619 52.361
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.043 0.004
       2: 0.030 0.003
       3: 4.449 0.445
       4: 3.150 0.315
       5: 0.043 0.004
       6: 0.030 0.003
       7: 4.469 0.447
       8: 3.165 0.317
       9: 0.043 0.004
      10: 0.030 0.003
      11: 4.467 0.447
      12: 3.131 0.313
      13: 0.040 0.004
      14: 0.025 0.003
      15: 4.177 0.418
      16: 2.674 0.267
      17: 0.029 0.003
      18: 0.017 0.002
      19: 3.007 0.301
      20: 1.909 0.191
      21: 0.006 0.001
      22: 0.004 0.000
      23: 0.667 0.067
      24: 0.462 0.046
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.154                -0.173
       5:          mean_ground_truth                -0.164                -0.164
       6:                         sd                 0.052                 0.049
       7:                         se                 0.005                 0.005
       8:                       bias                  0.01                -0.009
       9:                    bias_se                 0.005                 0.005
      10:              relative_bias                -0.064                 0.052
      11:           relative_bias_se                 0.032                  0.03
      12:                        mse                 0.003                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.94                  0.92
      15:                coverage_se                 0.024                 0.027
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.86                  0.91
      19:    rejection_proportion_se                 0.035                 0.029
      20:                      n_sim                   100                   100
      21:                        p25                -0.189                -0.206
      22:                        p50                -0.156                -0.183
      23:                        p75                -0.114                -0.139
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:             -15.23             -17.13                   -0.154
       5:            -16.489            -16.489                   -0.164
       6:              5.534              5.172                    0.052
       7:              0.553              0.517                    0.005
       8:              1.259             -0.641                     0.01
       9:              0.553              0.517                    0.005
      10:             -0.076              0.039                   -0.064
      11:              0.034              0.031                    0.032
      12:             31.904             26.892                    0.003
      13:              4.123              3.474                        0
      14:               0.94               0.88                     0.94
      15:              0.024              0.032                    0.024
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.81                0.9                     0.86
      19:              0.039               0.03                    0.035
      20:                100                100                      100
      21:            -19.403            -20.479                   -0.189
      22:            -15.078            -18.002                   -0.156
      23:            -11.464             -13.57                   -0.114
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.184               -15.318               -18.342
       5:                   -0.164               -16.561               -16.561
       6:                    0.033                 5.557                 3.453
       7:                    0.003                 0.556                 0.345
       8:                    -0.02                 1.243                -1.781
       9:                    0.003                 0.556                 0.345
      10:                    0.121                -0.075                 0.108
      11:                     0.02                 0.034                 0.021
      12:                    0.001                32.119                14.975
      13:                        0                 4.114                 1.688
      14:                     0.85                  0.94                  0.86
      15:                    0.036                 0.024                 0.035
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                   0.8                  0.99
      19:                        0                  0.04                  0.01
      20:                      100                   100                   100
      21:                   -0.209               -19.481               -21.116
      22:                   -0.185               -15.436               -18.424
      23:                   -0.163               -11.412               -16.239
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.154                   -0.199               -15.786
       5:                   -0.164                   -0.164               -16.841
       6:                    0.052                    0.007                 5.523
       7:                    0.005                    0.001                 0.552
       8:                     0.01                   -0.035                 1.055
       9:                    0.005                    0.001                 0.552
      10:                   -0.064                    0.214                -0.063
      11:                    0.032                    0.004                 0.033
      12:                    0.003                    0.001                31.308
      13:                        0                        0                 3.905
      14:                     0.94                     0.11                  0.93
      15:                    0.024                    0.031                 0.026
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.86                        1                  0.83
      19:                    0.035                        0                 0.038
      20:                      100                      100                   100
      21:                   -0.189                     -0.2               -19.755
      22:                   -0.156                     -0.2               -15.784
      23:                   -0.114                     -0.2               -12.055
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -20.475
       5:               -16.841
       6:                 0.833
       7:                 0.083
       8:                -3.634
       9:                 0.083
      10:                 0.216
      11:                 0.005
      12:                13.892
      13:                 0.578
      14:                  0.11
      15:                 0.031
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -20.815
      22:               -20.617
      23:               -20.235
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
      [1] 100
      
      $args$n_patients_ground_truth
      [1] 1000
      
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
                 arm primary__hrqol_at_eof primary__hrqol_auc
          1:  Active                   0.7           73.85335
          2:  Active                   0.7           73.85335
          3:  Active                   0.7           73.85335
          4:  Active                   0.7           73.85335
          5:  Active                   0.7           73.85335
         ---                                                 
       9996: Control                    NA                 NA
       9997: Control                   0.0            0.00000
       9998: Control                    NA                 NA
       9999: Control                   0.0            0.00000
      10000: Control                   0.0            0.00000
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
          1:                      0.7              74.24879                      0.7
          2:                      0.7              74.24879                      0.7
          3:                      0.7              74.24879                      0.7
          4:                      0.7              74.24879                      0.7
          5:                      0.7              74.24879                      0.7
         ---                                                                        
       9996:                       NA                    NA                       NA
       9997:                      0.0               0.00000                       NA
       9998:                       NA                    NA                       NA
       9999:                      0.0               0.00000                       NA
      10000:                      0.0               0.00000                       NA
             secondary2__hrqol_auc trial_id
          1:              74.59979        6
          2:              74.59979       68
          3:              74.59979      100
          4:              74.59979       62
          5:              74.59979       20
         ---                               
       9996:                    NA       62
       9997:                    NA        5
       9998:                    NA       41
       9999:                    NA       34
      10000:                    NA       35
      
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
       1:    primary__hrqol_at_eof  Active       all  0.518  0.553  0.574  0.550
       2:    primary__hrqol_at_eof Control       all  0.377  0.400  0.420  0.398
       3:       primary__hrqol_auc  Active       all 54.059 57.053 59.547 56.823
       4:       primary__hrqol_auc Control       all 39.513 41.835 44.244 41.810
       5: secondary1__hrqol_at_eof  Active       all  0.518  0.553  0.574  0.550
       6: secondary1__hrqol_at_eof Control       all  0.377  0.400  0.420  0.398
       7:    secondary1__hrqol_auc  Active       all 54.385 57.460 59.917 57.242
       8:    secondary1__hrqol_auc Control       all 39.902 42.201 44.599 42.148
       9: secondary2__hrqol_at_eof  Active       all  0.518  0.553  0.574  0.550
      10: secondary2__hrqol_at_eof Control       all  0.377  0.400  0.420  0.398
      11:    secondary2__hrqol_auc  Active       all 54.459 57.386 60.004 57.449
      12:    secondary2__hrqol_auc Control       all 39.477 42.061 44.145 41.794
      13:    primary__hrqol_at_eof  Active survivors  0.588  0.618  0.630  0.609
      14:    primary__hrqol_at_eof Control survivors  0.419  0.441  0.457  0.439
      15:       primary__hrqol_auc  Active survivors 60.888 63.712 65.459 62.947
      16:       primary__hrqol_auc Control survivors 43.906 46.258 48.166 46.074
      17: secondary1__hrqol_at_eof  Active survivors  0.634  0.663  0.682  0.657
      18: secondary1__hrqol_at_eof Control survivors  0.462  0.475  0.481  0.470
      19:    secondary1__hrqol_auc  Active survivors 66.332 68.906 70.578 68.384
      20:    secondary1__hrqol_auc Control survivors 48.631 50.065 51.212 49.720
      21: secondary2__hrqol_at_eof  Active survivors  0.700  0.700  0.700  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.500  0.500  0.500  0.498
      23:    secondary2__hrqol_auc  Active survivors 72.817 73.084 73.240 72.885
      24:    secondary2__hrqol_auc Control survivors 52.168 52.401 52.592 52.279
                           outcome     arm  analysis    p25    p50    p75   mean
             sd    se
       1: 0.038 0.004
       2: 0.031 0.003
       3: 3.853 0.385
       4: 3.333 0.333
       5: 0.038 0.004
       6: 0.031 0.003
       7: 3.874 0.387
       8: 3.356 0.336
       9: 0.038 0.004
      10: 0.031 0.003
      11: 3.933 0.393
      12: 3.284 0.328
      13: 0.034 0.003
      14: 0.027 0.003
      15: 3.483 0.348
      16: 2.933 0.293
      17: 0.026 0.003
      18: 0.018 0.002
      19: 2.731 0.273
      20: 2.027 0.203
      21: 0.005 0.001
      22: 0.004 0.000
      23: 0.613 0.061
      24: 0.513 0.051
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.152                -0.171
       5:          mean_ground_truth                -0.175                -0.175
       6:                         sd                 0.051                 0.046
       7:                         se                 0.005                 0.005
       8:                       bias                 0.023                 0.004
       9:                    bias_se                 0.005                 0.005
      10:              relative_bias                -0.132                -0.026
      11:           relative_bias_se                 0.029                 0.026
      12:                        mse                 0.003                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.96                  0.92
      15:                coverage_se                  0.02                 0.027
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.85                  0.94
      19:    rejection_proportion_se                 0.036                 0.024
      20:                      n_sim                   100                   100
      21:                        p25                -0.194                -0.204
      22:                        p50                -0.145                -0.171
      23:                        p75                -0.114                 -0.14
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -15.013            -16.873                   -0.152
       5:            -17.623            -17.623                   -0.174
       6:              5.219              4.739                    0.051
       7:              0.522              0.474                    0.005
       8:              2.611               0.75                    0.022
       9:              0.522              0.474                    0.005
      10:             -0.148             -0.043                   -0.129
      11:               0.03              0.027                    0.029
      12:             33.785             22.796                    0.003
      13:              3.825                2.9                        0
      14:               0.95               0.95                     0.96
      15:              0.022              0.022                     0.02
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:                0.8               0.93                     0.85
      19:               0.04              0.026                    0.036
      20:                100                100                      100
      21:            -19.386            -20.399                   -0.194
      22:            -14.517            -16.837                   -0.145
      23:            -11.078            -13.703                   -0.114
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.188               -15.094               -18.664
       5:                   -0.174               -17.649               -17.649
       6:                    0.032                 5.252                 3.429
       7:                    0.003                 0.525                 0.343
       8:                   -0.013                 2.555                -1.015
       9:                    0.003                 0.525                 0.343
      10:                    0.075                -0.145                 0.058
      11:                    0.019                  0.03                 0.019
      12:                    0.001                33.831                12.673
      13:                        0                 3.824                 1.447
      14:                     0.88                  0.95                   0.9
      15:                    0.032                 0.022                  0.03
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                  0.79                     1
      19:                        0                 0.041                     0
      20:                      100                   100                   100
      21:                   -0.211               -19.471               -21.647
      22:                   -0.189               -14.573               -18.533
      23:                   -0.166               -11.104               -16.135
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.152                     -0.2               -15.654
       5:                   -0.174                   -0.174                -18.02
       6:                    0.051                    0.007                 5.259
       7:                    0.005                    0.001                 0.526
       8:                    0.022                   -0.025                 2.366
       9:                    0.005                    0.001                 0.526
      10:                   -0.129                    0.146                -0.131
      11:                    0.029                    0.004                 0.029
      12:                    0.003                    0.001                32.976
      13:                        0                        0                 3.739
      14:                     0.96                      0.1                  0.95
      15:                     0.02                     0.03                 0.022
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.85                        1                  0.84
      19:                    0.036                        0                 0.037
      20:                      100                      100                   100
      21:                   -0.194                     -0.2               -20.312
      22:                   -0.145                     -0.2               -14.873
      23:                   -0.114                     -0.2               -11.784
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -20.606
       5:                -18.02
       6:                 0.736
       7:                 0.074
       8:                -2.586
       9:                 0.074
      10:                 0.143
      11:                 0.004
      12:                 7.223
      13:                 0.375
      14:                   0.1
      15:                  0.03
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:                   -21
      22:               -20.595
      23:               -20.303
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
      [1] 100
      
      $args$n_patients_ground_truth
      [1] 1000
      
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
                 arm primary__hrqol_at_eof primary__hrqol_auc
          1:  Active                   0.7           73.94681
          2:  Active                   0.7           73.94681
          3:  Active                   0.7           73.94681
          4:  Active                   0.7           73.94681
          5:  Active                   0.7           73.94681
         ---                                                 
       9996: Control                   0.0            0.00000
       9997: Control                   0.0            0.00000
       9998: Control                   0.0            0.00000
       9999: Control                   0.0            0.00000
      10000: Control                   0.0            0.00000
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
          1:                      0.7              74.12358                      0.7
          2:                      0.7              74.12358                      0.7
          3:                      0.7              74.12358                      0.7
          4:                      0.7              74.12358                      0.7
          5:                      0.7              74.12358                      0.7
         ---                                                                        
       9996:                      0.0               0.00000                       NA
       9997:                       NA                    NA                       NA
       9998:                      0.0               0.00000                       NA
       9999:                      0.0               0.00000                       NA
      10000:                      0.0               0.00000                       NA
             secondary2__hrqol_auc trial_id
          1:              72.29524       89
          2:              72.29524       33
          3:              72.29524       55
          4:              72.29524       62
          5:              72.29524       59
         ---                               
       9996:                    NA       87
       9997:                    NA       53
       9998:                    NA       82
       9999:                    NA       90
      10000:                    NA       30
      
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

