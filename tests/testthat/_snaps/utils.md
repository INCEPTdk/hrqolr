# Misc. utils

    Code
      log_timediff(start = start_, msg = "Message", now = end_)
    Message
      2023-10-25 11:00:00: Message (1 hours)

# summarise_vars works

    Code
      summarise_var(x)
    Output
      $p25
      [1] 0.5225
      
      $p50
      [1] 0.63
      
      $p75
      [1] 0.7175
      
      $mean
      [1] 0.55
      
      $sd
      [1] 0.2711293
      
      $se
      [1] 0.08573862
      

---

    Code
      hrqolr:::summarise_var(x, probs = c(0.025, 0.5, 0.975))
    Output
      $p2.5
      [1] 0.04475
      
      $p50
      [1] 0.63
      
      $p97.5
      [1] 0.82425
      
      $mean
      [1] 0.55
      
      $sd
      [1] 0.2711293
      
      $se
      [1] 0.08573862
      

---

    Code
      summarise_var(c(x, NA))
    Output
      $p25
      [1] 0.5225
      
      $p50
      [1] 0.63
      
      $p75
      [1] 0.7175
      
      $mean
      [1] 0.55
      
      $sd
      [1] 0.2711293
      
      $se
      [1] 0.08573862
      

# stop0, warning0 and cat0 work

    error message

---

    warning message

