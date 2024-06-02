# Caching works

    Code
      cache$info()
    Output
      $max_size
      10.2 kB
      
      $total_size
      8.1 kB
      
      $max_total_size
      8.1 kB
      

---

    Code
      cache$info(c("max_size", "total_size"))
    Output
      $max_size
      10.2 kB
      
      $total_size
      8.1 kB
      

---

    Code
      cache$info(c("max_total_size"))
    Output
      8.1 kB

