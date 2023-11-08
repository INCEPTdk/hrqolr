# Example trajectories are sampled correctly

    Code
      trajs
    Output
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
                arm  id   x      y
         1:  Active   1   0 0.0000
         2:  Active   1  21 0.0000
         3:  Active   1  35 0.0621
         4:  Active   1  49 0.1334
         5:  Active   1  63 0.2271
        ---                       
      1220: Control 100 136 0.3946
      1221: Control 100 150 0.4138
      1222: Control 100 164 0.4330
      1223: Control 100 178 0.4548
      1224: Control 100 192 0.5000
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               

