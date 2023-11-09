# Example trajectories are sampled correctly

    Code
      trajs
    Output
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
                arm  id  x     y
         1:  Active   1  0 0.000
         2:  Active   1 21 0.260
         3:  Active   1 35 0.344
         4:  Active   1 49 0.431
         5:  Active   1 63 0.537
        ---                     
      1208: Control  99  0 0.000
      1209: Control  99  4 0.390
      1210: Control  99 17 0.000
      1211: Control 100  0 0.000
      1212: Control 100 10    NA
      
      attr(,"class")
      [1] "hrqolr_trajectories" "list"               

