# simulate_trials S3 method works

    Code
      sims_single_batch
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50     p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.527  0.548   0.575  0.554
       2:    primary__hrqol_at_eof Control       all  0.378  0.400   0.419  0.398
       3:       primary__hrqol_auc  Active       all 79.464 82.278  86.808 83.423
       4:       primary__hrqol_auc Control       all 58.570 62.207  65.123 61.982
       5: secondary1__hrqol_at_eof  Active       all  0.527  0.548   0.578  0.554
       6: secondary1__hrqol_at_eof Control       all  0.378  0.400   0.419  0.399
       7:    secondary1__hrqol_auc  Active       all 78.433 81.360  85.943 82.403
       8:    secondary1__hrqol_auc Control       all 57.408 60.909  63.892 60.756
       9: secondary2__hrqol_at_eof  Active       all  0.527  0.548   0.578  0.554
      10: secondary2__hrqol_at_eof Control       all  0.378  0.400   0.419  0.399
      11:    secondary2__hrqol_auc  Active       all 71.688 74.549  78.452 75.287
      12:    secondary2__hrqol_auc Control       all 51.617 54.491  57.243 54.476
      13:    primary__hrqol_at_eof  Active survivors  0.590  0.607   0.640  0.612
      14:    primary__hrqol_at_eof Control survivors  0.421  0.439   0.458  0.440
      15:       primary__hrqol_auc  Active survivors 88.299 91.435  96.156 92.193
      16:       primary__hrqol_auc Control survivors 65.346 68.277  71.313 68.414
      17: secondary1__hrqol_at_eof  Active survivors  0.643  0.658   0.675  0.658
      18: secondary1__hrqol_at_eof Control survivors  0.461  0.474   0.486  0.474
      19:    secondary1__hrqol_auc  Active survivors 95.257 98.062 100.514 97.895
      20:    secondary1__hrqol_auc Control survivors 70.076 71.913  74.403 72.322
      21: secondary2__hrqol_at_eof  Active survivors  0.686  0.695   0.704  0.697
      22: secondary2__hrqol_at_eof Control survivors  0.488  0.499   0.509  0.499
      23:    secondary2__hrqol_auc  Active survivors 93.156 94.529  95.647 94.726
      24:    secondary2__hrqol_auc Control survivors 66.653 68.171  69.694 68.233
                           outcome     arm  analysis    p25    p50     p75   mean
             sd    se
       1: 0.045 0.004
       2: 0.030 0.003
       3: 6.885 0.689
       4: 4.650 0.465
       5: 0.045 0.004
       6: 0.030 0.003
       7: 6.810 0.681
       8: 4.568 0.457
       9: 0.045 0.004
      10: 0.030 0.003
      11: 6.074 0.607
      12: 4.080 0.408
      13: 0.039 0.004
      14: 0.025 0.003
      15: 6.043 0.604
      16: 4.026 0.403
      17: 0.030 0.003
      18: 0.022 0.002
      19: 4.776 0.478
      20: 3.474 0.347
      21: 0.016 0.002
      22: 0.017 0.002
      23: 2.321 0.232
      24: 2.432 0.243
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.155                -0.172
       5:          mean_ground_truth                -0.155                -0.155
       6:                         sd                 0.052                 0.045
       7:                         se                 0.005                 0.005
       8:                       bias                     0                -0.017
       9:                    bias_se                 0.005                 0.005
      10:              relative_bias                 0.003                 0.112
      11:           relative_bias_se                 0.033                 0.029
      12:                        mse                 0.003                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.94                  0.93
      15:                coverage_se                 0.024                 0.026
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.83                  0.96
      19:    rejection_proportion_se                 0.038                  0.02
      20:                      n_sim                   100                   100
      21:                        p25                -0.184                -0.199
      22:                        p50                -0.153                -0.168
      23:                        p75                -0.118                -0.141
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -21.441             -23.78                   -0.155
       5:            -17.584            -17.584                   -0.155
       6:              8.047              7.134                    0.052
       7:              0.805              0.713                    0.005
       8:             -3.857             -6.196                        0
       9:              0.805              0.713                    0.005
      10:              0.219              0.352                    0.003
      11:              0.046              0.041                    0.033
      12:             78.978             88.768                    0.003
      13:             11.982             11.977                        0
      14:               0.89               0.82                     0.94
      15:              0.031              0.038                    0.024
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.71                0.9                     0.82
      19:              0.045               0.03                    0.038
      20:                100                100                      100
      21:            -25.971            -28.334                   -0.184
      22:            -20.929            -23.189                   -0.153
      23:            -15.599            -18.718                   -0.118
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.184               -21.647               -25.574
       5:                   -0.155               -18.532               -18.532
       6:                    0.036                 7.942                 5.679
       7:                    0.004                 0.794                 0.568
       8:                   -0.029                -3.115                -7.041
       9:                    0.004                 0.794                 0.568
      10:                    0.186                 0.168                  0.38
      11:                    0.023                 0.043                 0.031
      12:                    0.002                 72.15                81.509
      13:                        0                10.893                 9.425
      14:                     0.84                   0.9                  0.73
      15:                    0.037                  0.03                 0.044
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                        1                  0.73                     1
      19:                        0                 0.044                     0
      20:                      100                   100                   100
      21:                   -0.211               -26.167               -29.809
      22:                    -0.18               -21.286               -25.438
      23:                   -0.158               -15.554               -21.734
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.155                   -0.198                -20.81
       5:                   -0.155                   -0.155               -20.899
       6:                    0.052                    0.024                 7.084
       7:                    0.005                    0.002                 0.708
       8:                        0                   -0.043                 0.089
       9:                    0.005                    0.002                 0.708
      10:                    0.003                    0.276                -0.004
      11:                    0.033                    0.016                 0.034
      12:                    0.003                    0.002                 49.69
      13:                        0                        0                 6.641
      14:                     0.94                     0.58                  0.94
      15:                    0.024                    0.049                 0.024
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.82                        1                   0.8
      19:                    0.038                        0                  0.04
      20:                      100                      100                   100
      21:                   -0.184                   -0.211               -24.848
      22:                   -0.153                   -0.196               -20.537
      23:                   -0.118                   -0.181               -15.554
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -26.492
       5:               -20.899
       6:                 3.416
       7:                 0.342
       8:                -5.593
       9:                 0.342
      10:                 0.268
      11:                 0.016
      12:                42.831
      13:                 4.398
      14:                  0.61
      15:                 0.049
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -28.499
      22:                -26.08
      23:               -23.989
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
            1       1 
      
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
      acceleration_hrqol                      1           1
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14
      
      
      $trial_results
                 arm primary__hrqol_at_eof primary__hrqol_auc
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
      
      $example_trajectories
      $arm_level
               arm      x   y
        1:  Active   0.00 0.0
        2:  Active   5.00 0.2
        3:  Active   5.01 0.2
        4:  Active   5.02 0.2
        5:  Active   5.04 0.2
       ---                   
      594: Control 186.60 0.5
      595: Control 186.76 0.5
      596: Control 186.88 0.5
      597: Control 186.96 0.5
      598: Control 187.00 0.5
      
      $patient_level
                 arm   id   x     y
          1:  Active    1   0 0.000
          2:  Active    1  21 0.230
          3:  Active    1  35 0.314
          4:  Active    1  49 0.401
          5:  Active    1  63 0.507
         ---                       
      24454: Control 2000 130 0.544
      24455: Control 2000 144 0.548
      24456: Control 2000 158 0.550
      24457: Control 2000 172 0.550
      24458: Control 2000 186 0.550
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_two_batches_verbose
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50     p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.533  0.565   0.592  0.562
       2:    primary__hrqol_at_eof Control       all  0.379  0.403   0.423  0.401
       3:       primary__hrqol_auc  Active       all 79.934 85.032  89.084 84.580
       4:       primary__hrqol_auc Control       all 58.941 62.681  65.935 62.445
       5: secondary1__hrqol_at_eof  Active       all  0.533  0.565   0.593  0.563
       6: secondary1__hrqol_at_eof Control       all  0.379  0.403   0.423  0.401
       7:    secondary1__hrqol_auc  Active       all 79.022 84.009  88.034 83.578
       8:    secondary1__hrqol_auc Control       all 57.647 61.459  64.719 61.212
       9: secondary2__hrqol_at_eof  Active       all  0.533  0.565   0.593  0.563
      10: secondary2__hrqol_at_eof Control       all  0.379  0.403   0.423  0.401
      11:    secondary2__hrqol_auc  Active       all 72.278 76.820  80.504 76.424
      12:    secondary2__hrqol_auc Control       all 51.651 55.054  57.894 54.898
      13:    primary__hrqol_at_eof  Active survivors  0.599  0.621   0.644  0.620
      14:    primary__hrqol_at_eof Control survivors  0.423  0.444   0.461  0.442
      15:       primary__hrqol_auc  Active survivors 90.125 93.444  96.839 93.238
      16:       primary__hrqol_auc Control survivors 65.771 68.961  71.778 68.750
      17: secondary1__hrqol_at_eof  Active survivors  0.645  0.665   0.684  0.663
      18: secondary1__hrqol_at_eof Control survivors  0.458  0.475   0.491  0.474
      19:    secondary1__hrqol_auc  Active survivors 95.539 98.685 101.703 98.557
      20:    secondary1__hrqol_auc Control survivors 69.778 72.275  74.864 72.281
      21: secondary2__hrqol_at_eof  Active survivors  0.686  0.700   0.711  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.488  0.500   0.510  0.499
      23:    secondary2__hrqol_auc  Active survivors 93.182 95.002  96.656 94.869
      24:    secondary2__hrqol_auc Control survivors 66.715 68.413  69.778 68.294
                           outcome     arm  analysis    p25    p50     p75   mean
             sd    se
       1: 0.042 0.002
       2: 0.033 0.001
       3: 6.341 0.284
       4: 5.238 0.234
       5: 0.042 0.002
       6: 0.033 0.001
       7: 6.281 0.281
       8: 5.149 0.230
       9: 0.042 0.002
      10: 0.033 0.001
      11: 5.682 0.254
      12: 4.533 0.203
      13: 0.035 0.002
      14: 0.029 0.001
      15: 5.379 0.241
      16: 4.645 0.208
      17: 0.028 0.001
      18: 0.023 0.001
      19: 4.465 0.200
      20: 3.770 0.169
      21: 0.018 0.001
      22: 0.016 0.001
      23: 2.557 0.114
      24: 2.330 0.104
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.161                -0.178
       5:          mean_ground_truth                -0.158                -0.158
       6:                         sd                 0.053                 0.046
       7:                         se                 0.002                 0.002
       8:                       bias                -0.003                 -0.02
       9:                    bias_se                 0.002                 0.002
      10:              relative_bias                 0.018                 0.126
      11:           relative_bias_se                 0.015                 0.013
      12:                        mse                 0.003                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                 0.942                 0.918
      15:                coverage_se                  0.01                 0.012
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                 0.842                 0.964
      19:    rejection_proportion_se                 0.016                 0.008
      20:                      n_sim                   500                   500
      21:                        p25                -0.199                -0.207
      22:                        p50                -0.157                -0.178
      23:                        p75                -0.125                -0.148
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -22.134            -24.489                   -0.161
       5:            -21.976            -21.976                   -0.158
       6:              8.127              7.159                    0.053
       7:              0.363               0.32                    0.002
       8:             -0.158             -2.512                   -0.003
       9:              0.363               0.32                    0.002
      10:              0.007              0.114                    0.019
      11:              0.017              0.015                    0.015
      12:             65.945             57.461                    0.003
      13:              4.131              3.783                        0
      14:              0.946              0.926                    0.942
      15:               0.01              0.012                     0.01
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:              0.758              0.914                    0.842
      19:              0.019              0.013                    0.016
      20:                500                500                      500
      21:            -27.752            -29.155                   -0.199
      22:            -21.784            -24.332                   -0.157
      23:            -16.604            -19.725                   -0.125
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.189               -22.365               -26.276
       5:                   -0.158               -22.215               -22.215
       6:                    0.037                 8.031                 5.947
       7:                    0.002                 0.359                 0.266
       8:                   -0.031                 -0.15                -4.061
       9:                    0.002                 0.359                 0.266
      10:                    0.198                 0.007                 0.183
      11:                     0.01                 0.016                 0.012
      12:                    0.002                64.389                51.787
      13:                        0                 4.023                  2.96
      14:                    0.816                 0.948                 0.866
      15:                    0.017                  0.01                 0.015
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                    0.994                 0.774                 0.988
      19:                    0.003                 0.019                 0.005
      20:                      500                   500                   500
      21:                   -0.217               -27.931               -30.603
      22:                   -0.187               -21.891               -26.263
      23:                   -0.165               -16.705               -21.984
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.161                   -0.199               -21.526
       5:                   -0.158                   -0.158               -21.247
       6:                    0.053                    0.024                   7.2
       7:                    0.002                    0.001                 0.322
       8:                   -0.003                   -0.041                -0.278
       9:                    0.002                    0.001                 0.322
      10:                    0.019                    0.258                 0.013
      11:                    0.015                    0.007                 0.015
      12:                    0.003                    0.002                51.817
      13:                        0                        0                 3.219
      14:                    0.942                     0.58                  0.95
      15:                     0.01                    0.022                  0.01
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                    0.842                        1                  0.83
      19:                    0.016                        0                 0.017
      20:                      500                      500                   500
      21:                   -0.199                   -0.216               -26.653
      22:                   -0.157                     -0.2               -20.923
      23:                   -0.125                   -0.183               -16.637
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -26.576
       5:               -21.247
       6:                 3.414
       7:                 0.153
       8:                -5.328
       9:                 0.153
      10:                 0.251
      11:                 0.007
      12:                40.023
      13:                 1.751
      14:                 0.632
      15:                 0.022
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   500
      21:               -29.017
      22:               -26.649
      23:                -24.27
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
            1       1 
      
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
      acceleration_hrqol                      1           1
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
               arm      x   y
        1:  Active   0.00 0.0
        2:  Active   8.00 0.2
        3:  Active   8.01 0.2
        4:  Active   8.02 0.2
        5:  Active   8.04 0.2
       ---                   
      594: Control 189.59 0.5
      595: Control 189.75 0.5
      596: Control 189.88 0.5
      597: Control 189.96 0.5
      598: Control 190.00 0.5
      
      $patient_level
               arm id   x     y
        1:  Active  1   0 0.000
        2:  Active  1  21 0.170
        3:  Active  1  35 0.254
        4:  Active  1  49 0.341
        5:  Active  1  63 0.447
       ---                     
      253: Control 20 131 0.565
      254: Control 20 145 0.568
      255: Control 20 159 0.570
      256: Control 20 173 0.570
      257: Control 20 187 0.570
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

---

    Code
      sims_single_batch_without_examples
    Output
      $summary_stats
                           outcome     arm  analysis    p25    p50     p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.525  0.558   0.585  0.556
       2:    primary__hrqol_at_eof Control       all  0.381  0.407   0.427  0.402
       3:       primary__hrqol_auc  Active       all 79.565 84.059  88.310 83.690
       4:       primary__hrqol_auc Control       all 58.986 63.286  66.349 62.434
       5: secondary1__hrqol_at_eof  Active       all  0.525  0.558   0.585  0.556
       6: secondary1__hrqol_at_eof Control       all  0.381  0.407   0.427  0.402
       7:    secondary1__hrqol_auc  Active       all 78.618 82.965  87.226 82.677
       8:    secondary1__hrqol_auc Control       all 57.755 62.077  65.165 61.222
       9: secondary2__hrqol_at_eof  Active       all  0.525  0.558   0.585  0.556
      10: secondary2__hrqol_at_eof Control       all  0.381  0.407   0.427  0.402
      11:    secondary2__hrqol_auc  Active       all 71.526 75.932  79.673 75.578
      12:    secondary2__hrqol_auc Control       all 52.039 55.684  58.348 54.953
      13:    primary__hrqol_at_eof  Active survivors  0.595  0.613   0.636  0.614
      14:    primary__hrqol_at_eof Control survivors  0.423  0.440   0.465  0.440
      15:       primary__hrqol_auc  Active survivors 89.099 92.360  95.900 92.320
      16:       primary__hrqol_auc Control survivors 65.804 68.142  72.111 68.422
      17: secondary1__hrqol_at_eof  Active survivors  0.638  0.656   0.674  0.656
      18: secondary1__hrqol_at_eof Control survivors  0.460  0.477   0.492  0.474
      19:    secondary1__hrqol_auc  Active survivors 94.582 97.456 100.219 97.430
      20:    secondary1__hrqol_auc Control survivors 70.235 72.947  74.973 72.270
      21: secondary2__hrqol_at_eof  Active survivors  0.684  0.698   0.709  0.697
      22: secondary2__hrqol_at_eof Control survivors  0.488  0.501   0.510  0.498
      23:    secondary2__hrqol_auc  Active survivors 92.861 94.991  96.317 94.703
      24:    secondary2__hrqol_auc Control survivors 66.552 68.807  69.721 68.163
                           outcome     arm  analysis    p25    p50     p75   mean
             sd    se
       1: 0.040 0.004
       2: 0.032 0.003
       3: 6.175 0.617
       4: 5.160 0.516
       5: 0.040 0.004
       6: 0.032 0.003
       7: 6.130 0.613
       8: 5.078 0.508
       9: 0.040 0.004
      10: 0.032 0.003
      11: 5.563 0.556
      12: 4.392 0.439
      13: 0.035 0.003
      14: 0.029 0.003
      15: 5.272 0.527
      16: 4.714 0.471
      17: 0.028 0.003
      18: 0.023 0.002
      19: 4.297 0.430
      20: 3.787 0.379
      21: 0.019 0.002
      22: 0.016 0.002
      23: 2.671 0.267
      24: 2.327 0.233
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.155                -0.173
       5:          mean_ground_truth                -0.149                -0.149
       6:                         sd                 0.056                 0.044
       7:                         se                 0.006                 0.004
       8:                       bias                -0.006                -0.024
       9:                    bias_se                 0.006                 0.004
      10:              relative_bias                 0.037                 0.163
      11:           relative_bias_se                 0.037                  0.03
      12:                        mse                 0.003                 0.003
      13:                     mse_se                     0                     0
      14:                   coverage                  0.93                   0.9
      15:                coverage_se                 0.026                  0.03
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.82                  0.96
      19:    rejection_proportion_se                 0.038                  0.02
      20:                      n_sim                   100                   100
      21:                        p25                -0.192                -0.205
      22:                        p50                -0.153                -0.171
      23:                        p75                 -0.12                -0.145
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -21.256            -23.897                   -0.154
       5:            -20.885            -20.885                   -0.149
       6:              8.645              6.899                    0.056
       7:              0.864               0.69                    0.006
       8:             -0.371             -3.012                   -0.005
       9:              0.864               0.69                    0.006
      10:              0.018              0.144                    0.036
      11:              0.041              0.033                    0.037
      12:             74.119             56.193                    0.003
      13:              9.506              7.153                        0
      14:               0.95               0.93                     0.93
      15:              0.022              0.026                    0.026
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.71               0.89                     0.81
      19:              0.045              0.031                    0.039
      20:                100                100                      100
      21:            -27.964            -28.994                   -0.192
      22:            -21.266            -23.117                   -0.153
      23:              -15.7            -19.375                    -0.12
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.181               -21.454                -25.16
       5:                   -0.149               -21.127               -21.127
       6:                    0.036                 8.561                 5.663
       7:                    0.004                 0.856                 0.566
       8:                   -0.032                -0.327                -4.033
       9:                    0.004                 0.856                 0.566
      10:                    0.215                 0.015                 0.191
      11:                    0.024                 0.041                 0.027
      12:                    0.002                72.662                48.007
      13:                        0                 9.364                 6.348
      14:                     0.87                  0.95                  0.89
      15:                    0.034                 0.022                 0.031
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                     0.99                  0.75                  0.97
      19:                     0.01                 0.043                 0.017
      20:                      100                   100                   100
      21:                   -0.202               -28.055                -28.77
      22:                   -0.181               -21.502               -25.325
      23:                   -0.158               -16.039               -21.523
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.154                   -0.199               -20.625
       5:                   -0.149                   -0.149               -20.032
       6:                    0.056                    0.025                 7.632
       7:                    0.006                    0.003                 0.763
       8:                   -0.005                    -0.05                -0.594
       9:                    0.006                    0.003                 0.763
      10:                    0.036                    0.332                  0.03
      11:                    0.037                    0.017                 0.038
      12:                    0.003                    0.003                58.021
      13:                        0                        0                 7.687
      14:                     0.93                     0.51                  0.93
      15:                    0.026                     0.05                 0.026
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.81                        1                  0.81
      19:                    0.039                        0                 0.039
      20:                      100                      100                   100
      21:                   -0.192                   -0.215               -26.061
      22:                   -0.153                   -0.199               -20.456
      23:                    -0.12                    -0.18               -15.915
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:                -26.54
       5:               -20.032
       6:                 3.654
       7:                 0.365
       8:                -6.508
       9:                 0.365
      10:                 0.325
      11:                 0.018
      12:                55.575
      13:                 5.099
      14:                  0.53
      15:                  0.05
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -28.925
      22:               -26.466
      23:               -23.803
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
            1       1 
      
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
      acceleration_hrqol                      1           1
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters            0.1         0.1
      sampling_frequency                     14          14
      
      
      $trial_results
                 arm primary__hrqol_at_eof primary__hrqol_auc
          1:  Active                  0.52           74.58472
          2:  Active                  0.52           74.58472
          3:  Active                  0.00            3.67092
          4:  Active                  0.89          142.21564
          5:  Active                  0.80          126.30185
         ---                                                 
       9996: Control                  0.52           65.42504
       9997: Control                  0.64           92.76675
       9998: Control                  0.00            0.38000
       9999: Control                  0.43           66.13734
      10000: Control                  0.00            1.05000
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
          1:                     0.52             74.675034                     0.52
          2:                     0.52             74.675034                     0.52
          3:                     0.00              2.180308                     0.00
          4:                     0.89            139.379483                     0.89
          5:                     0.80            124.702758                     0.80
         ---                                                                        
       9996:                     0.52             65.767142                     0.52
       9997:                     0.64             89.941432                     0.64
       9998:                       NA                    NA                       NA
       9999:                     0.43             65.180957                     0.43
      10000:                       NA                    NA                       NA
             secondary2__hrqol_auc trial_id
          1:           69.09907588       64
          2:           69.09907588       27
          3:            0.06547158       27
          4:          121.79225196       69
          5:          107.49106323       56
         ---                               
       9996:           70.39453088       15
       9997:           87.21808124        6
       9998:                    NA       81
       9999:           60.11172359       22
      10000:                    NA       61
      
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
                           outcome     arm  analysis    p25    p50     p75   mean
       1:    primary__hrqol_at_eof  Active       all  0.526  0.553   0.585  0.551
       2:    primary__hrqol_at_eof Control       all  0.379  0.397   0.422  0.400
       3:       primary__hrqol_auc  Active       all 79.636 82.695  88.059 82.942
       4:       primary__hrqol_auc Control       all 58.788 61.562  65.747 62.035
       5: secondary1__hrqol_at_eof  Active       all  0.526  0.553   0.585  0.551
       6: secondary1__hrqol_at_eof Control       all  0.379  0.399   0.422  0.400
       7:    secondary1__hrqol_auc  Active       all 78.590 81.779  86.885 81.927
       8:    secondary1__hrqol_auc Control       all 57.573 60.610  64.498 60.826
       9: secondary2__hrqol_at_eof  Active       all  0.526  0.553   0.585  0.551
      10: secondary2__hrqol_at_eof Control       all  0.379  0.399   0.422  0.400
      11:    secondary2__hrqol_auc  Active       all 71.328 74.884  79.624 74.898
      12:    secondary2__hrqol_auc Control       all 51.843 54.368  57.697 54.651
      13:    primary__hrqol_at_eof  Active survivors  0.585  0.609   0.633  0.609
      14:    primary__hrqol_at_eof Control survivors  0.422  0.441   0.464  0.442
      15:       primary__hrqol_auc  Active survivors 88.022 91.415  95.793 91.683
      16:       primary__hrqol_auc Control survivors 65.416 68.609  72.339 68.610
      17: secondary1__hrqol_at_eof  Active survivors  0.638  0.659   0.676  0.656
      18: secondary1__hrqol_at_eof Control survivors  0.457  0.473   0.489  0.473
      19:    secondary1__hrqol_auc  Active survivors 94.863 97.721 101.029 97.539
      20:    secondary1__hrqol_auc Control survivors 68.817 72.091  74.851 71.946
      21: secondary2__hrqol_at_eof  Active survivors  0.684  0.696   0.710  0.698
      22: secondary2__hrqol_at_eof Control survivors  0.486  0.496   0.511  0.498
      23:    secondary2__hrqol_auc  Active survivors 92.880 94.536  96.733 94.803
      24:    secondary2__hrqol_auc Control survivors 66.176 67.788  69.970 68.034
                           outcome     arm  analysis    p25    p50     p75   mean
             sd    se
       1: 0.037 0.004
       2: 0.032 0.003
       3: 5.783 0.578
       4: 5.258 0.526
       5: 0.037 0.004
       6: 0.032 0.003
       7: 5.700 0.570
       8: 5.170 0.517
       9: 0.037 0.004
      10: 0.032 0.003
      11: 5.109 0.511
      12: 4.483 0.448
      13: 0.036 0.004
      14: 0.031 0.003
      15: 5.726 0.573
      16: 5.045 0.505
      17: 0.030 0.003
      18: 0.024 0.002
      19: 4.702 0.470
      20: 4.043 0.404
      21: 0.017 0.002
      22: 0.017 0.002
      23: 2.552 0.255
      24: 2.461 0.246
             sd    se
      
      $comparisons
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
       1:                 comparator                Active                Active
       2:                     target               Control               Control
       3:                   analysis                   all             survivors
       4:              mean_estimate                -0.151                -0.167
       5:          mean_ground_truth                -0.155                -0.155
       6:                         sd                 0.049                 0.047
       7:                         se                 0.005                 0.005
       8:                       bias                 0.003                -0.013
       9:                    bias_se                 0.005                 0.005
      10:              relative_bias                 -0.02                 0.081
      11:           relative_bias_se                 0.032                  0.03
      12:                        mse                 0.002                 0.002
      13:                     mse_se                     0                     0
      14:                   coverage                  0.97                  0.94
      15:                coverage_se                 0.017                 0.024
      16:    bias_corrected_coverage                     1                     1
      17: bias_corrected_coverage_se                     0                     0
      18:       rejection_proportion                  0.82                  0.93
      19:    rejection_proportion_se                 0.038                 0.026
      20:                      n_sim                   100                   100
      21:                        p25                -0.182                -0.201
      22:                        p50                -0.147                -0.168
      23:                        p75                -0.118                -0.133
                           statistic primary__hrqol_at_eof primary__hrqol_at_eof
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
       1:             Active             Active                   Active
       2:            Control            Control                  Control
       3:                all          survivors                      all
       4:            -20.907            -23.073                   -0.151
       5:            -21.668            -21.668                   -0.155
       6:              7.877              7.603                     0.05
       7:              0.788               0.76                    0.005
       8:              0.761             -1.405                    0.003
       9:              0.788               0.76                    0.005
      10:             -0.035              0.065                   -0.022
      11:              0.036              0.035                    0.032
      12:             62.003             59.204                    0.002
      13:              7.852              7.336                        0
      14:               0.97               0.94                     0.97
      15:              0.017              0.024                    0.017
      16:                  1                  1                        1
      17:                  0                  0                        0
      18:               0.71               0.84                     0.82
      19:              0.045              0.037                    0.038
      20:                100                100                      100
      21:            -25.358            -28.734                   -0.182
      22:            -19.621            -23.131                   -0.147
      23:            -15.655            -17.408                   -0.118
          primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
       1:                   Active                Active                Active
       2:                  Control               Control               Control
       3:                survivors                   all             survivors
       4:                   -0.183               -21.101               -25.593
       5:                   -0.155               -21.883               -21.883
       6:                    0.041                 7.748                  6.62
       7:                    0.004                 0.775                 0.662
       8:                   -0.029                 0.783                 -3.71
       9:                    0.004                 0.775                 0.662
      10:                    0.185                -0.036                  0.17
      11:                    0.027                 0.035                  0.03
      12:                    0.002                60.039                57.143
      13:                        0                 7.551                 7.416
      14:                     0.81                  0.97                  0.83
      15:                    0.039                 0.017                 0.038
      16:                        1                     1                     1
      17:                        0                     0                     0
      18:                     0.99                  0.73                  0.96
      19:                     0.01                 0.044                  0.02
      20:                      100                   100                   100
      21:                   -0.214               -25.366               -30.031
      22:                    -0.18               -19.924               -25.287
      23:                   -0.161               -15.832               -21.605
          secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
       1:                   Active                   Active                Active
       2:                  Control                  Control               Control
       3:                      all                survivors                   all
       4:                   -0.151                     -0.2               -20.248
       5:                   -0.155                   -0.155               -20.667
       6:                     0.05                    0.027                 6.813
       7:                    0.005                    0.003                 0.681
       8:                    0.003                   -0.045                 0.419
       9:                    0.005                    0.003                 0.681
      10:                   -0.022                    0.292                 -0.02
      11:                    0.032                    0.017                 0.033
      12:                    0.002                    0.003                46.125
      13:                        0                        0                 5.854
      14:                     0.97                     0.56                  0.98
      15:                    0.017                     0.05                 0.014
      16:                        1                        1                     1
      17:                        0                        0                     0
      18:                     0.82                        1                   0.8
      19:                    0.038                        0                  0.04
      20:                      100                      100                   100
      21:                   -0.182                   -0.213                -24.18
      22:                   -0.147                   -0.198               -19.253
      23:                   -0.118                   -0.183               -15.509
          secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc
          secondary2__hrqol_auc
       1:                Active
       2:               Control
       3:             survivors
       4:               -26.769
       5:               -20.667
       6:                 3.808
       7:                 0.381
       8:                -6.102
       9:                 0.381
      10:                 0.295
      11:                 0.018
      12:                51.591
      13:                 5.387
      14:                  0.59
      15:                 0.049
      16:                     1
      17:                     0
      18:                     1
      19:                     0
      20:                   100
      21:               -28.896
      22:               -26.426
      23:                -24.62
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
            1       1 
      
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
      acceleration_hrqol                      1           1
      mortality                             0.2         0.2
      mortality_dampening                     0           0
      mortality_trajectory_shape      exp_decay   exp_decay
      prop_mortality_benefitters              0           0
      sampling_frequency                     14          14
      
      
      $trial_results
                 arm primary__hrqol_at_eof primary__hrqol_auc
          1:  Active                  0.82          129.80839
          2:  Active                  0.82          129.80839
          3:  Active                  0.82          129.80839
          4:  Active                  0.68          103.52639
          5:  Active                  0.68          103.52639
         ---                                                 
       9996: Control                    NA                 NA
       9997: Control                  0.23           19.98569
       9998: Control                  0.56           84.68643
       9999: Control                    NA                 NA
      10000: Control                    NA                 NA
             secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
          1:                     0.82             127.17678                     0.82
          2:                     0.82             127.17678                     0.82
          3:                     0.82             127.17678                     0.82
          4:                     0.68             102.35096                     0.68
          5:                     0.68             102.35096                     0.68
         ---                                                                        
       9996:                       NA                    NA                       NA
       9997:                     0.23              22.95751                     0.23
       9998:                     0.56              82.39659                     0.56
       9999:                       NA                    NA                       NA
      10000:                       NA                    NA                       NA
             secondary2__hrqol_auc trial_id
          1:             116.77880       89
          2:             116.77880       50
          3:             116.77880       64
          4:              92.85834       40
          5:              92.85834      100
         ---                               
       9996:                    NA       31
       9997:              29.10874       44
       9998:              78.33562       19
       9999:                    NA       69
      10000:                    NA       32
      
      $example_trajectories
      $arm_level
               arm      x   y
        1:  Active   0.00 0.0
        2:  Active   8.00 0.2
        3:  Active   8.01 0.2
        4:  Active   8.02 0.2
        5:  Active   8.04 0.2
       ---                   
      594: Control 189.59 0.5
      595: Control 189.75 0.5
      596: Control 189.88 0.5
      597: Control 189.96 0.5
      598: Control 190.00 0.5
      
      $patient_level
               arm id   x     y
        1:  Active  1   0 0.000
        2:  Active  1  21 0.260
        3:  Active  1  35 0.344
        4:  Active  1  49 0.431
        5:  Active  1  63 0.537
       ---                     
      237: Control 20 131 0.495
      238: Control 20 145 0.498
      239: Control 20 159 0.500
      240: Control 20 173 0.500
      241: Control 20 187 0.500
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               
      
      attr(,"class")
      [1] "hrqolr_results" "list"          

