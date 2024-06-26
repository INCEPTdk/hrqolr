# simulate_trial S3 method works

    Code
      trial_sim_two_arms
    Output
      $patient_results
            patient_id     arm primary__hrqol_at_eof primary__hrqol_auc
                 <int>  <char>                 <num>              <num>
         1:          1  Active                  0.73          104.84905
         2:          2  Active                  0.67          102.10972
         3:          3  Active                  0.67          102.10972
         4:          4  Active                  0.67          102.10972
         5:          5  Active                  0.67          102.10972
        ---                                                            
      1996:       1996 Control                  0.28           38.87883
      1997:       1997 Control                  0.63          103.15985
      1998:       1998 Control                  0.29           40.11103
      1999:       1999 Control                  0.54           79.65187
      2000:       2000 Control                  0.34           49.63339
            secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
                               <num>                 <num>                    <num>
         1:                     0.73             103.57432                     0.73
         2:                     0.67             101.15003                     0.67
         3:                     0.67             101.15003                     0.67
         4:                     0.67             101.15003                     0.67
         5:                     0.67             101.15003                     0.67
        ---                                                                        
      1996:                     0.28              39.15702                     0.28
      1997:                     0.63             100.44527                     0.63
      1998:                     0.29              40.65307                     0.29
      1999:                     0.54              77.54662                     0.54
      2000:                     0.34              49.48369                     0.34
            secondary2__hrqol_auc
                            <num>
         1:             101.27936
         2:              90.09908
         3:              90.09908
         4:              90.09908
         5:              90.09908
        ---                      
      1996:              36.97945
      1997:              87.86499
      1998:              40.37328
      1999:              70.72749
      2000:              45.72135
      
      $mean_diffs
                           outcome  analysis comparator  target         est p_value
                            <char>    <char>     <char>  <char>       <num>   <num>
       1:    primary__hrqol_at_eof       all     Active Control  -0.1699200       0
       2:    primary__hrqol_at_eof survivors     Active Control  -0.1885357       0
       3:       primary__hrqol_auc       all     Active Control -23.6130499       0
       4:       primary__hrqol_auc survivors     Active Control -26.2244278       0
       5: secondary1__hrqol_at_eof       all     Active Control  -0.1699200       0
       6: secondary1__hrqol_at_eof survivors     Active Control  -0.1888240       0
       7:    secondary1__hrqol_auc       all     Active Control -23.8683034       0
       8:    secondary1__hrqol_auc survivors     Active Control -26.4018066       0
       9: secondary2__hrqol_at_eof       all     Active Control  -0.1699200       0
      10: secondary2__hrqol_at_eof survivors     Active Control  -0.1889381       0
      11:    secondary2__hrqol_auc       all     Active Control -22.7323139       0
      12:    secondary2__hrqol_auc survivors     Active Control -25.2162410       0
                ci_lo       ci_hi     test_fun
                <num>       <num>       <char>
       1:  -0.1933813  -0.1464587 welch_t_test
       2:  -0.2098066  -0.1672648 welch_t_test
       3: -27.2550136 -19.9710862 welch_t_test
       4: -29.5503279 -22.8985276 welch_t_test
       5:  -0.1933813  -0.1464587 welch_t_test
       6:  -0.2070756  -0.1705724 welch_t_test
       7: -27.4697832 -20.2668237 welch_t_test
       8: -29.2719919 -23.5316213 welch_t_test
       9:  -0.1933813  -0.1464587 welch_t_test
      10:  -0.2028550  -0.1750211 welch_t_test
      11: -25.9502173 -19.5144106 welch_t_test
      12: -27.1649540 -23.2675280 welch_t_test
      
      $scenario
      - arms                               Active     Control
      - n_patients                           1000        1000
      - index_hrqol                             0           0
      - first_hrqol                           0.2         0.2
      - final_hrqol                           0.7         0.5
      - acceleration_hrqol                      1           1
      - mortality                             0.2         0.2
      - mortality_dampening                     0           0
      - mortality_trajectory_shape      exp_decay   exp_decay
      - prop_mortality_benefitters            0.1         0.1
      - sampling_frequency                     14          14
      
      attr(,"class")
      [1] "hrqolr_trial" "list"        

---

    Code
      trial_sim_three_arms
    Output
      $patient_results
            patient_id     arm primary__hrqol_at_eof primary__hrqol_auc
                 <int>  <char>                 <num>              <num>
         1:          1 Active1                  0.64           88.78405
         2:          2 Active1                  0.69          105.77972
         3:          3 Active1                  0.69          105.77972
         4:          4 Active1                  0.69          105.77972
         5:          5 Active1                  0.69          105.77972
        ---                                                            
      2996:       2996 Control                  0.52           77.54643
      2997:       2997 Control                  0.00           18.90000
      2998:       2998 Control                  0.45           65.04497
      2999:       2999 Control                  0.00            1.12000
      3000:       3000 Control                  0.00            0.95000
            secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
                               <num>                 <num>                    <num>
         1:                     0.64              88.63432                     0.64
         2:                     0.69             104.68003                     0.69
         3:                     0.69             104.68003                     0.69
         4:                     0.69             104.68003                     0.69
         5:                     0.69             104.68003                     0.69
        ---                                                                        
      2996:                     0.52              75.75659                     0.52
      2997:                     0.00              15.88235                     0.00
      2998:                     0.45              64.15326                     0.45
      2999:                       NA                    NA                       NA
      3000:                       NA                    NA                       NA
            secondary2__hrqol_auc
                            <num>
         1:             88.319360
         2:             92.899076
         3:             92.899076
         4:             92.899076
         5:             92.899076
        ---                      
      2996:             72.575616
      2997:              5.717647
      2998:             62.070599
      2999:                    NA
      3000:                    NA
      
      $mean_diffs
                           outcome  analysis comparator  target          est p_value
                            <char>    <char>     <char>  <char>        <num>   <num>
       1:    primary__hrqol_at_eof       all    Active1 Active2  -0.07945000 7.0e-10
       2:    primary__hrqol_at_eof       all    Active1 Control  -0.15364000 0.0e+00
       3:    primary__hrqol_at_eof       all    Active2 Control  -0.07419000 0.0e+00
       4:    primary__hrqol_at_eof survivors    Active1 Active2  -0.09266878 0.0e+00
       5:    primary__hrqol_at_eof survivors    Active1 Control  -0.17691153 0.0e+00
       6:    primary__hrqol_at_eof survivors    Active2 Control  -0.08424275 0.0e+00
       7:       primary__hrqol_auc       all    Active1 Active2 -11.38558146 8.3e-09
       8:       primary__hrqol_auc       all    Active1 Control -21.64978569 0.0e+00
       9:       primary__hrqol_auc       all    Active2 Control -10.26420423 1.9e-09
      10:       primary__hrqol_auc survivors    Active1 Active2 -13.33063856 0.0e+00
      11:       primary__hrqol_auc survivors    Active1 Control -25.04399913 0.0e+00
      12:       primary__hrqol_auc survivors    Active2 Control -11.71336058 0.0e+00
      13: secondary1__hrqol_at_eof       all    Active1 Active2  -0.07945000 7.0e-10
      14: secondary1__hrqol_at_eof       all    Active1 Control  -0.15364000 0.0e+00
      15: secondary1__hrqol_at_eof       all    Active2 Control  -0.07419000 0.0e+00
      16: secondary1__hrqol_at_eof survivors    Active1 Active2  -0.09019273 0.0e+00
      17: secondary1__hrqol_at_eof survivors    Active1 Control  -0.18601081 0.0e+00
      18: secondary1__hrqol_at_eof survivors    Active2 Control  -0.09581808 0.0e+00
      19:    secondary1__hrqol_auc       all    Active1 Active2 -11.43791575 4.8e-09
      20:    secondary1__hrqol_auc       all    Active1 Control -21.81819018 0.0e+00
      21:    secondary1__hrqol_auc       all    Active2 Control -10.38027442 7.0e-10
      22:    secondary1__hrqol_auc survivors    Active1 Active2 -12.96662014 0.0e+00
      23:    secondary1__hrqol_auc survivors    Active1 Control -26.48531839 0.0e+00
      24:    secondary1__hrqol_auc survivors    Active2 Control -13.51869825 0.0e+00
      25: secondary2__hrqol_at_eof       all    Active1 Active2  -0.07945000 7.0e-10
      26: secondary2__hrqol_at_eof       all    Active1 Control  -0.15364000 0.0e+00
      27: secondary2__hrqol_at_eof       all    Active2 Control  -0.07419000 0.0e+00
      28: secondary2__hrqol_at_eof survivors    Active1 Active2  -0.09229459 0.0e+00
      29: secondary2__hrqol_at_eof survivors    Active1 Control  -0.19955002 0.0e+00
      30: secondary2__hrqol_at_eof survivors    Active2 Control  -0.10725543 0.0e+00
      31:    secondary2__hrqol_auc       all    Active1 Active2 -10.71686382 1.1e-09
      32:    secondary2__hrqol_auc       all    Active1 Control -20.64132743 0.0e+00
      33:    secondary2__hrqol_auc       all    Active2 Control  -9.92446361 1.0e-10
      34:    secondary2__hrqol_auc survivors    Active1 Active2 -12.44178328 0.0e+00
      35:    secondary2__hrqol_auc survivors    Active1 Control -26.83781931 0.0e+00
      36:    secondary2__hrqol_auc survivors    Active2 Control -14.39603603 0.0e+00
                           outcome  analysis comparator  target          est p_value
                 ci_lo        ci_hi          test_fun
                 <num>        <num>            <char>
       1:  -0.10869883  -0.05020117 games_howell_test
       2:  -0.18082312  -0.12645688 games_howell_test
       3:  -0.09904255  -0.04933745 games_howell_test
       4:  -0.11880520  -0.06653236 games_howell_test
       5:  -0.20117834  -0.15264472 games_howell_test
       6:  -0.10678161  -0.06170389 games_howell_test
       7: -15.85651540  -6.91464752 games_howell_test
       8: -25.81115995 -17.48841144 games_howell_test
       9: -14.13445644  -6.39395202 games_howell_test
      10: -17.33282428  -9.32845283 games_howell_test
      11: -28.75924419 -21.32875408 games_howell_test
      12: -15.23822479  -8.18849636 games_howell_test
      13:  -0.10869883  -0.05020117 games_howell_test
      14:  -0.18082312  -0.12645688 games_howell_test
      15:  -0.09904255  -0.04933745 games_howell_test
      16:  -0.11205554  -0.06832992 games_howell_test
      17:  -0.20661646  -0.16540516 games_howell_test
      18:  -0.11467668  -0.07695948 games_howell_test
      19: -15.86300227  -7.01282924 games_howell_test
      20: -25.93178071 -17.70459964 games_howell_test
      21: -14.19562813  -6.56492071 games_howell_test
      22: -16.30826806  -9.62497221 games_howell_test
      23: -29.61852930 -23.35210748 games_howell_test
      24: -16.46380400 -10.57359251 games_howell_test
      25:  -0.10869883  -0.05020117 games_howell_test
      26:  -0.18082312  -0.12645688 games_howell_test
      27:  -0.09904255  -0.04933745 games_howell_test
      28:  -0.10843138  -0.07615780 games_howell_test
      29:  -0.21561797  -0.18348206 games_howell_test
      30:  -0.12179393  -0.09271693 games_howell_test
      31: -14.70340248  -6.73032516 games_howell_test
      32: -24.34356141 -16.93909345 games_howell_test
      33: -13.32532730  -6.52359992 games_howell_test
      34: -14.64270266 -10.24086389 games_howell_test
      35: -29.01505640 -24.66058221 games_howell_test
      36: -16.39858858 -12.39348349 games_howell_test
                 ci_lo        ci_hi          test_fun
      
      $scenario
      - arms                            Active1   Active2   Control
      - n_patients                         1000      1000      1000
      - index_hrqol                           0         0         0
      - first_hrqol                         0.2       0.2       0.2
      - final_hrqol                         0.7       0.6       0.5
      - acceleration_hrqol                    1         1         1
      - mortality                           0.2       0.2       0.2
      - mortality_dampening                   0         0         0
      - mortality_trajectory_shape       linear    linear    linear
      - prop_mortality_benefitters            0         0         0
      - sampling_frequency                   14        14        14
      
      attr(,"class")
      [1] "hrqolr_trial" "list"        

