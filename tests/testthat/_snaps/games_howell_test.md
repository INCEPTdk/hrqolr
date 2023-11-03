# Games-Howell test works

    Code
      games_howell_test(x, g)
    Output
         comparator target      est   p_value      ci_lo     ci_hi
      1:          1      2  0.23450 0.4161312 -0.3897526 0.8587526
      2:          1      3  0.09575 0.9120225 -0.6190600 0.8105600
      3:          2      3 -0.13875 0.7346158 -0.8265726 0.5490726

---

    Code
      games_howell_test(x, g, na_replacement = 0)
    Output
         comparator target      est    p_value        ci_lo     ci_hi
      1:          1      2  0.42100 0.04882979  0.003228222 0.8387718
      2:          1      3  0.28225 0.41147300 -0.375028798 0.9395288
      3:          2      3 -0.13875 0.73461580 -0.826572558 0.5490726

