# simulate_trial S3 method works

    Code
      trial_sim_two_arms
    Output
      $patient_results
           patient_id     arm primary__hrqol_at_eof primary__hrqol_auc
                <int>  <char>                 <num>              <num>
        1:          1  Active                  0.82         120.914055
        2:          2  Active                  0.81         127.799723
        3:          3  Active                  0.81         127.799723
        4:          4  Active                  0.60          88.528902
        5:          5  Active                  0.89         142.898386
        6:          6  Active                  0.63          94.108902
        7:          7  Active                  0.71         109.061388
        8:          8  Active                  0.71         109.061388
        9:          9  Active                  0.66          93.069831
       10:         10  Active                  0.69         105.371388
       11:         11  Active                  0.72          88.910740
       12:         12  Active                    NA                 NA
       13:         13  Active                  0.70          99.508280
       14:         14  Active                  0.71          91.541310
       15:         15  Active                  0.65          98.851851
       16:         16  Active                  0.65          98.055645
       17:         17  Active                  0.53          75.851388
       18:         18  Active                  0.66          99.888386
       19:         19  Active                    NA                 NA
       20:         20  Active                  0.98         159.921732
       21:         21  Active                  0.56          83.271732
       22:         22  Active                  0.71         101.288280
       23:         23  Active                  0.55          79.655645
       24:         24  Active                  0.55          81.446732
       25:         25  Active                  0.60          81.283773
       26:         26  Active                  0.70          94.018209
       27:         27  Active                  0.66          99.895645
       28:         28  Active                  0.64          96.215645
       29:         29  Active                  0.49          70.496732
       30:         30  Active                  0.58          84.726523
       31:         31  Active                  0.72         111.284723
       32:         32  Active                  0.76         118.288902
       33:         33  Active                  0.65          97.972439
       34:         34  Active                  0.65          97.972439
       35:         35  Active                  0.70          98.470124
       36:         36  Active                  0.85         135.081523
       37:         37  Active                  0.59          88.746732
       38:         38  Active                  0.69         105.779723
       39:         39  Active                  0.00           1.920000
       40:         40  Active                  0.65          99.696732
       41:         41  Active                  0.69         105.333077
       42:         42  Active                  0.00           2.005925
       43:         43  Active                  0.00           0.330000
       44:         44  Active                  0.70         107.614723
       45:         45  Active                  0.66         100.681851
       46:         46  Active                  0.81         127.588902
       47:         47  Active                  0.00           1.640813
       48:         48  Active                  0.66          92.832158
       49:         49  Active                  0.77         120.135645
       50:         50  Active                  0.00           1.081673
       51:         51 Control                    NA                 NA
       52:         52 Control                  0.51          81.271111
       53:         53 Control                  0.38          52.172682
       54:         54 Control                  0.52          82.753387
       55:         55 Control                  0.63         102.993387
       56:         56 Control                  0.00           0.450000
       57:         57 Control                  0.42          64.329833
       58:         58 Control                  0.50          79.248834
       59:         59 Control                  0.00           0.350000
       60:         60 Control                  0.46          66.647716
       61:         61 Control                  0.00           2.320000
       62:         62 Control                  0.60          97.741111
       63:         63 Control                  0.54          86.509846
       64:         64 Control                  0.31          44.113387
       65:         65 Control                  0.00           2.280000
       66:         66 Control                  0.00           4.495000
       67:         67 Control                  0.58          94.081111
       68:         68 Control                  0.48          75.437341
       69:         69 Control                  0.22          27.309846
       70:         70 Control                    NA                 NA
       71:         71 Control                  0.00           1.690000
       72:         72 Control                  0.50          72.691867
       73:         73 Control                  0.52          83.543039
       74:         74 Control                  0.54          75.386668
       75:         75 Control                  0.46          65.744924
       76:         76 Control                    NA                 NA
       77:         77 Control                  0.55          88.591111
       78:         78 Control                  0.37          55.071032
       79:         79 Control                  0.64         105.293914
       80:         80 Control                  0.62         101.229833
       81:         81 Control                  0.58          93.909846
       82:         82 Control                  0.33          48.053834
       83:         83 Control                  0.44          67.997341
       84:         84 Control                    NA                 NA
       85:         85 Control                  0.50          79.073387
       86:         86 Control                    NA                 NA
       87:         87 Control                  0.75         126.283463
       88:         88 Control                  0.42          64.263914
       89:         89 Control                  0.00          -0.090000
       90:         90 Control                  0.53          85.368039
       91:         91 Control                  0.43          66.147478
       92:         92 Control                  0.55          88.273387
       93:         93 Control                  0.42          64.292478
       94:         94 Control                  0.73         121.531111
       95:         95 Control                  0.49          77.611111
       96:         96 Control                  0.45          64.354774
       97:         97 Control                  0.00           1.980000
       98:         98 Control                  0.59          96.211032
       99:         99 Control                  0.51          71.297311
      100:        100 Control                    NA                 NA
           patient_id     arm primary__hrqol_at_eof primary__hrqol_auc
           secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
                              <num>                 <num>                    <num>
        1:                     0.82           118.5143192                     0.82
        2:                     0.81           125.8600337                     0.81
        3:                     0.81           125.8600337                     0.81
        4:                     0.60            88.1015953                     0.60
        5:                     0.89           139.5317792                     0.89
        6:                     0.63            93.3815953                     0.63
        7:                     0.71           107.6309628                     0.71
        8:                     0.71           107.6309628                     0.71
        9:                     0.66            92.9043534                     0.66
       10:                     0.69           104.1109628                     0.69
       11:                     0.72            89.4196711                     0.72
       12:                       NA                    NA                       NA
       13:                     0.70            98.6221067                     0.70
       14:                     0.71            93.2241306                     0.71
       15:                     0.65            98.1527581                     0.65
       16:                     0.65            97.1394831                     0.65
       17:                     0.53            75.9509628                     0.53
       18:                     0.66            98.9367792                     0.66
       19:                       NA                    NA                       NA
       20:                     0.98           157.9969082                     0.98
       21:                     0.56            83.2369082                     0.56
       22:                     0.71           100.2821067                     0.71
       23:                     0.55            79.5394831                     0.55
       24:                     0.55            81.4569082                     0.55
       25:                     0.60            81.4458845                     0.60
       26:                     0.70            94.3533807                     0.70
       27:                     0.66            98.8994831                     0.66
       28:                     0.64            95.3794831                     0.64
       29:                     0.49            70.7769082                     0.49
       30:                     0.58            84.5368093                     0.58
       31:                     0.72           109.9750337                     0.72
       32:                     0.76           116.2615953                     0.76
       33:                     0.65            97.1322318                     0.65
       34:                     0.65            97.1322318                     0.65
       35:                     0.70            97.2974024                     0.70
       36:                     0.85           132.0568093                     0.85
       37:                     0.59            88.5769082                     0.59
       38:                     0.69           104.6800337                     0.69
       39:                       NA                    NA                       NA
       40:                     0.65            99.2569082                     0.65
       41:                     0.69           104.0487838                     0.69
       42:                     0.00             0.0000000                       NA
       43:                       NA                    NA                       NA
       44:                     0.70           106.4450337                     0.70
       45:                     0.66            99.9227581                     0.66
       46:                     0.81           125.0615953                     0.81
       47:                     0.00             0.3993853                       NA
       48:                     0.66            92.5890318                     0.66
       49:                     0.77           118.2594831                     0.77
       50:                       NA                    NA                       NA
       51:                       NA                    NA                       NA
       52:                     0.51            80.1316548                     0.51
       53:                     0.38            51.9841671                     0.38
       54:                     0.52            81.1636899                     0.52
       55:                     0.63           100.5236899                     0.63
       56:                       NA                    NA                       NA
       57:                     0.42            63.5225777                     0.42
       58:                     0.50            77.9870202                     0.50
       59:                       NA                    NA                       NA
       60:                     0.46            65.5905971                     0.46
       61:                       NA                    NA                       NA
       62:                     0.60            96.0616548                     0.60
       63:                     0.54            84.6052703                     0.54
       64:                     0.31            44.2036899                     0.31
       65:                       NA                    NA                       NA
       66:                       NA                    NA                       NA
       67:                     0.58            92.5216548                     0.58
       68:                     0.48            73.9809572                     0.48
       69:                     0.22            28.2852703                     0.22
       70:                       NA                    NA                       NA
       71:                       NA                    NA                       NA
       72:                     0.50            71.0266236                     0.50
       73:                     0.52            82.6941449                     0.52
       74:                     0.54            73.7219041                     0.54
       75:                     0.46            64.4886572                     0.46
       76:                       NA                    NA                       NA
       77:                     0.55            87.2116548                     0.55
       78:                     0.37            54.7730675                     0.37
       79:                     0.64           102.1140856                     0.64
       80:                     0.62            98.7225777                     0.62
       81:                     0.58            91.6452703                     0.58
       82:                     0.33            47.9820202                     0.33
       83:                     0.44            66.9409572                     0.44
       84:                       NA                    NA                       NA
       85:                     0.50            77.6436899                     0.50
       86:                       NA                    NA                       NA
       87:                     0.75           121.8193391                     0.75
       88:                     0.42            63.3940856                     0.42
       89:                       NA                    NA                       NA
       90:                     0.53            84.4741449                     0.53
       91:                     0.43            65.2112772                     0.43
       92:                     0.55            86.4436899                     0.55
       93:                     0.42            63.4512772                     0.42
       94:                     0.73           119.0716548                     0.73
       95:                     0.49            76.5916548                     0.49
       96:                     0.45            63.2803414                     0.45
       97:                       NA                    NA                       NA
       98:                     0.59            93.6030675                     0.59
       99:                     0.51            70.2828606                     0.51
      100:                       NA                    NA                       NA
           secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
           secondary2__hrqol_auc
                           <num>
        1:             114.23936
        2:             109.69908
        3:             109.69908
        4:              83.26954
        5:             127.06880
        6:              87.61954
        7:              97.11834
        8:              97.11834
        9:              93.08148
       10:              94.27834
       11:              93.09515
       12:                    NA
       13:              96.30100
       14:             100.00372
       15:              86.64106
       16:              87.95225
       17:              71.55834
       18:              93.25880
       19:                    NA
       20:             131.51142
       21:              73.55142
       22:              97.73100
       23:              73.85225
       24:              72.17142
       25:              80.85271
       26:              97.30523
       27:              89.36225
       28:              86.54225
       29:              63.89142
       30:              80.93390
       31:              97.09908
       32:             106.46954
       33:              92.41786
       34:              92.41786
       35:              92.92534
       36:             120.35390
       37:              77.69142
       38:              92.89908
       39:                    NA
       40:              85.97142
       41:              94.96165
       42:                    NA
       43:                    NA
       44:              94.29908
       45:              88.03106
       46:             113.71954
       47:                    NA
       48:              92.45587
       49:             104.87225
       50:                    NA
       51:                    NA
       52:              68.66464
       53:              50.96573
       54:              71.10135
       55:              86.61135
       56:                    NA
       57:              57.41900
       58:              67.77945
       59:                    NA
       60:              63.05653
       61:                    NA
       62:              81.17464
       63:              74.99499
       64:              41.49135
       65:                    NA
       66:                    NA
       67:              78.39464
       68:              67.36172
       69:              29.23499
       70:                    NA
       71:                    NA
       72:              65.32749
       73:              69.52285
       74:              72.19035
       75:              60.37652
       76:                    NA
       77:              74.22464
       78:              52.13328
       79:              91.19234
       80:              85.81900
       81:              80.71499
       82:              43.97945
       83:              61.56172
       84:                    NA
       85:              68.28135
       86:                    NA
       87:             108.73072
       88:              59.07234
       89:                    NA
       90:              70.90285
       91:              59.68919
       92:              75.33135
       93:              58.24919
       94:              99.24464
       95:              65.88464
       96:              60.32903
       97:                    NA
       98:              84.47328
       99:              69.99863
      100:                    NA
           secondary2__hrqol_auc
      
      $mean_diffs
                           outcome  analysis comparator  target         est
                            <char>    <char>     <char>  <char>       <num>
       1:    primary__hrqol_at_eof       all     Active Control  -0.2290000
       2:    primary__hrqol_at_eof survivors     Active Control  -0.2043182
       3:       primary__hrqol_auc       all     Active Control -31.7518910
       4:       primary__hrqol_auc survivors     Active Control -27.7144595
       5: secondary1__hrqol_at_eof       all     Active Control  -0.2290000
       6: secondary1__hrqol_at_eof survivors     Active Control  -0.1540556
       7:    secondary1__hrqol_auc       all     Active Control -32.0964408
       8:    secondary1__hrqol_auc survivors     Active Control -20.2896567
       9: secondary2__hrqol_at_eof       all     Active Control  -0.2290000
      10: secondary2__hrqol_at_eof survivors     Active Control  -0.1845672
      11:    secondary2__hrqol_auc       all     Active Control -31.2162448
      12:    secondary2__hrqol_auc survivors     Active Control -25.1039272
               p_value       ci_lo        ci_hi     test_fun
                 <num>       <num>        <num>       <char>
       1: 1.519564e-05  -0.3287962  -0.12920383 welch_t_test
       2: 3.580282e-05  -0.2976243  -0.11101202 welch_t_test
       3: 1.062752e-04 -47.3480207 -16.15576134 welch_t_test
       4: 3.173566e-04 -42.4129922 -13.01592673 welch_t_test
       5: 1.519564e-05  -0.3287962  -0.12920383 welch_t_test
       6: 5.345784e-06  -0.2166799  -0.09143122 welch_t_test
       7: 7.714372e-05 -47.5288929 -16.66398867 welch_t_test
       8: 2.110737e-04 -30.6807007  -9.89861282 welch_t_test
       9: 1.519564e-05  -0.3287962  -0.12920383 welch_t_test
      10: 3.147034e-11  -0.2314587  -0.13767567 welch_t_test
      11: 1.876643e-05 -44.9832962 -17.44919344 welch_t_test
      12: 2.263357e-10 -31.8895249 -18.31832945 welch_t_test
      
      $scenario
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
      
      attr(,"class")
      [1] "hrqolr_trial" "list"        

---

    Code
      trial_sim_three_arms
    Output
      $patient_results
           patient_id     arm primary__hrqol_at_eof primary__hrqol_auc
                <int>  <char>                 <num>              <num>
        1:          1 Active1                  0.76          110.20405
        2:          2 Active1                  0.78          122.29472
        3:          3 Active1                  0.75          116.42890
        4:          4 Active1                  0.61           90.53839
        5:          5 Active1                  0.59           86.66890
       ---                                                            
      146:        146 Control                  0.54           86.46983
      147:        147 Control                  0.67          110.35339
      148:        148 Control                  0.51           80.93483
      149:        149 Control                  0.63           95.40992
      150:        150 Control                  0.65          107.26804
           secondary1__hrqol_at_eof secondary1__hrqol_auc secondary2__hrqol_at_eof
                              <num>                 <num>                    <num>
        1:                     0.76             108.55432                     0.76
        2:                     0.78             120.56503                     0.78
        3:                     0.75             114.50160                     0.75
        4:                     0.61              90.11178                     0.61
        5:                     0.59              86.34160                     0.59
       ---                                                                        
      146:                     0.54              84.64258                     0.54
      147:                     0.67             107.56369                     0.67
      148:                     0.51              79.36258                     0.51
      149:                     0.63              92.19866                     0.63
      150:                     0.65             105.83414                     0.65
           secondary2__hrqol_auc
                           <num>
        1:             105.59936
        2:             105.49908
        3:             105.01954
        4:              85.90880
        5:              81.81954
       ---                      
      146:              74.45900
      147:              92.25135
      148:              70.19900
      149:              83.49652
      150:              87.46285
      
      $mean_diffs
                           outcome  analysis comparator  target          est
                            <char>    <char>     <char>  <char>        <num>
       1:    primary__hrqol_at_eof       all    Active1 Active2  -0.12940000
       2:    primary__hrqol_at_eof       all    Active1 Control  -0.16880000
       3:    primary__hrqol_at_eof       all    Active2 Control  -0.03940000
       4:    primary__hrqol_at_eof survivors    Active1 Active2  -0.08952652
       5:    primary__hrqol_at_eof survivors    Active1 Control  -0.17583333
       6:    primary__hrqol_at_eof survivors    Active2 Control  -0.08630682
       7:       primary__hrqol_auc       all    Active1 Active2 -18.14957385
       8:       primary__hrqol_auc       all    Active1 Control -23.39297933
       9:       primary__hrqol_auc       all    Active2 Control  -5.24340548
      10:       primary__hrqol_auc survivors    Active1 Active2 -11.95956948
      11:       primary__hrqol_auc survivors    Active1 Control -24.36768680
      12:       primary__hrqol_auc survivors    Active2 Control -12.40811732
      13: secondary1__hrqol_at_eof       all    Active1 Active2  -0.12940000
      14: secondary1__hrqol_at_eof       all    Active1 Control  -0.16880000
      15: secondary1__hrqol_at_eof       all    Active2 Control  -0.03940000
      16: secondary1__hrqol_at_eof survivors    Active1 Active2  -0.10584127
      17: secondary1__hrqol_at_eof survivors    Active1 Control  -0.20829314
      18: secondary1__hrqol_at_eof survivors    Active2 Control  -0.10245187
      19:    secondary1__hrqol_auc       all    Active1 Active2 -18.24040852
      20:    secondary1__hrqol_auc       all    Active1 Control -23.59216890
      21:    secondary1__hrqol_auc       all    Active2 Control  -5.35176038
      22:    secondary1__hrqol_auc survivors    Active1 Active2 -14.53670537
      23:    secondary1__hrqol_auc survivors    Active1 Control -29.37434706
      24:    secondary1__hrqol_auc survivors    Active2 Control -14.83764169
      25: secondary2__hrqol_at_eof       all    Active1 Active2  -0.12940000
      26: secondary2__hrqol_at_eof       all    Active1 Control  -0.16880000
      27: secondary2__hrqol_at_eof       all    Active2 Control  -0.03940000
      28: secondary2__hrqol_at_eof survivors    Active1 Active2  -0.10877907
      29: secondary2__hrqol_at_eof survivors    Active1 Control  -0.21894574
      30: secondary2__hrqol_at_eof survivors    Active2 Control  -0.11016667
      31:    secondary2__hrqol_auc       all    Active1 Active2 -18.13376888
      32:    secondary2__hrqol_auc       all    Active1 Control -23.31514074
      33:    secondary2__hrqol_auc       all    Active2 Control  -5.18137186
      34:    secondary2__hrqol_auc survivors    Active1 Active2 -15.41529985
      35:    secondary2__hrqol_auc survivors    Active1 Control -30.20314082
      36:    secondary2__hrqol_auc survivors    Active2 Control -14.78784097
                           outcome  analysis comparator  target          est
               p_value       ci_lo         ci_hi          test_fun
                 <num>       <num>         <num>            <char>
       1: 3.896045e-02  -0.2535168  -0.005283212 games_howell_test
       2: 8.089955e-04  -0.2749635  -0.062636500 games_howell_test
       3: 6.396843e-01  -0.1434397   0.064639669 games_howell_test
       4: 1.257028e-01  -0.1978573   0.018804223 games_howell_test
       5: 1.176614e-04  -0.2723269  -0.079339801 games_howell_test
       6: 5.390811e-02  -0.1737713   0.001157626 games_howell_test
       7: 6.855460e-02 -37.3792693   1.080121583 games_howell_test
       8: 3.280690e-03 -39.9833530  -6.802605693 games_howell_test
       9: 7.235288e-01 -21.5231818  11.036370790 games_howell_test
      10: 2.168228e-01 -28.8832560   4.964116991 games_howell_test
      11: 7.385386e-04 -39.5685732  -9.166800425 games_howell_test
      12: 8.793821e-02 -26.2435847   1.427350060 games_howell_test
      13: 3.896045e-02  -0.2535168  -0.005283212 games_howell_test
      14: 8.089955e-04  -0.2749635  -0.062636500 games_howell_test
      15: 6.396843e-01  -0.1434397   0.064639669 games_howell_test
      16: 1.225077e-02  -0.1922356  -0.019446891 games_howell_test
      17: 3.184708e-08  -0.2863758  -0.130210519 games_howell_test
      18: 4.692774e-03  -0.1776210  -0.027282778 games_howell_test
      19: 6.262575e-02 -37.2365473   0.755730295 games_howell_test
      20: 2.637515e-03 -39.9868879  -7.197449895 games_howell_test
      21: 7.073795e-01 -21.4143349  10.710814182 games_howell_test
      22: 3.425618e-02 -28.1954372  -0.877973500 games_howell_test
      23: 7.849995e-07 -41.8680747 -16.880619462 games_howell_test
      24: 1.078387e-02 -26.7605958  -2.914687612 games_howell_test
      25: 3.896045e-02  -0.2535168  -0.005283212 games_howell_test
      26: 8.089955e-04  -0.2749635  -0.062636500 games_howell_test
      27: 6.396843e-01  -0.1434397   0.064639669 games_howell_test
      28: 1.090829e-05  -0.1610298  -0.056528320 games_howell_test
      29: 1.544574e-10  -0.2674751  -0.170416339 games_howell_test
      30: 2.430841e-06  -0.1593170  -0.061016376 games_howell_test
      31: 3.470992e-02 -35.2122406  -1.055297122 games_howell_test
      32: 8.044490e-04 -37.9697796  -8.660501881 games_howell_test
      33: 6.612488e-01 -19.4045626   9.041818861 games_howell_test
      34: 1.732422e-05 -23.0015212  -7.829078452 games_howell_test
      35: 4.848277e-11 -37.2235302 -23.182751421 games_howell_test
      36: 5.894024e-06 -21.6652237  -7.910458255 games_howell_test
               p_value       ci_lo         ci_hi          test_fun
      
      $scenario
      - arms                            Active1   Active2   Control
      - n_patients                           50        50        50
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

