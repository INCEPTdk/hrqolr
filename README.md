
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hrqolr <img src="man/figures/hrqolr.png" align="right" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/epiben/hrqolr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/epiben/hrqolr/actions/workflows/R-CMD-check.yaml)
<!-- [![codecov](https://codecov.io/gh/INCEPTdk/adaptr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/INCEPTdk/adaptr/)
![total downloads from RStudio mirror](https://cranlogs.r-pkg.org/badges/grand-total/hrqolr) -->
<!-- badges: end -->

Package for simulating two-arm randomised clinical trials with temporal
trajectories of health-related quality of life (HRQoL) as the outcome
and quantifies effect sizes as single-sampled HRQoL values at end of
follow-up and as the area under the trajectories.

Developed as part of the INCEPT (Intensive Care Platform Trial) project
(<https://incept.dk/>), which is primarily supported by a grant from
Sygeforsikringen “danmark” (<https://www.sygeforsikring.dk/>).

## Resources

- [Website](https://inceptdk.github.io/hrqolr/index.html) - stand-alone
  website with full package documentation
- [Health-related quality of life trajectories in critical illness:
  protocol for a Monte Carlo simulation
  study](https://doi.org/10.1111/aas.14324) - article in Acta
  Anaesthesiologica Scandinavica outlining the first scientific study to
  use `hrqolr`

## Installation

`hrqolr` isn’t on CRAN yet but can be installed from GitHub if you have
the `remotes` package installed:

``` r
# install.packages("remotes") 
remotes::install_github("INCEPTdk/hrqolr")
```

You can also install the **development version** from directly from
GitHub. Doing this requires the *remotes*-package installed. The
development version may contain additional features not yet available in
the stable CRAN version, but may be unstable or lack documentation.

``` r
remotes::install_github("INCEPTdk/hrqolr@dev")
```

## Example

First, load the package and use the cache (the latter is optional but
highly recommended):

``` r
library(hrqolr)
cache_hrqolr()
```

    #> Loading 'hrqolr' package v0.0.9000.
    #> For help, run 'help("hrqolr")' or check out https://inceptdk.github.io/hrqolr/.
    #> Consider running 'cache_hrqolr()' for faster simulations. If you have enough RAM, increasing the cache size might speed up things even more; 
    #> run '?cache_hrqolr' for details.

`hrqolr` was built to simulate many scenarios, but here we define a
single scenario and use `do.call` to give the list elements as named
arguments to the function:

``` r
scenario <- list(
    n_trials = 100L,
    n_patients_per_arm = 100L,
    sampling_frequency = 14L,
    n_patients_ground_truth = 1000L,
    n_example_trajectories_per_arm = 100L,
    
    arms = c("A", "B"),
    first_hrqol = c(A = 0.1, B = 0.1),
    final_hrqol = c(A = 0.8, B = 0.7),
    acceleration_hrqol = c(A = 0.1, B = 0.0),
    
    mortality = c(A = 0.4, B = 0.4),
    mortality_dampening = c(A = 0.0, B = 0.0),
    mortality_trajectory_shape = c(A = "exp_decay", B = "exp_decay"),
    prop_mortality_benefitters = c(A = 0.0, B = 0.0),
    n_digits = 3
)

example_trajs <- do.call(sample_example_trajectories, scenario)
example_trajs
#> $arm_level
#>      arm          x         y
#>   1:   A   0.000000 0.0000000
#>   2:   A   6.000000 0.1000000
#>   3:   A   6.006612 0.1100942
#>   4:   A   6.019197 0.1102476
#>   5:   A   6.037682 0.1104924
#>  ---                         
#> 594:   B 187.599173 0.7000000
#> 595:   B 187.758853 0.7000000
#> 596:   B 187.879320 0.7000000
#> 597:   B 187.959920 0.7000000
#> 598:   B 188.000000 0.7000000
#> 
#> $patient_level
#>       arm  id  x     y
#>    1:   A   1  0 0.000
#>    2:   A   1  5 0.069
#>    3:   A   1 19 0.001
#>    4:   A   1 29 0.000
#>    5:   A   2  0 0.000
#>   ---                 
#> 2008:   B 200  0 0.000
#> 2009:   B 200  2 0.076
#> 2010:   B 200 16 0.003
#> 2011:   B 200 30 0.000
#> 2012:   B 200 31 0.000
#> 
#> attr(,"class")
#> [1] "hrqolr_trajectories" "list"
```

### Visualise trajectories

``` r
plot(example_trajs)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

You might also want to break apart the trajectories in the arms. Hiding
the legend, then, makes sense as the facet strips will already provide
the same information. Here, we also set the arm-level trajectory in
black to set it apart from the individual patient trajectories:

``` r
library(ggplot2) 

plot(example_trajs, arm_aes = list(colour = "black")) +
    facet_wrap(~ arm) +
    theme(legend.position = "none")
```

<img src="man/figures/README-unnamed-chunk-8-1.png" width="100%" />

Of course, we might also be interested in summarising the trajectories.
Here, for example, with inter-quartile ranges. Note that the ribbons
become a bit wonky at end of follow-up because there are increasingly
few observations, and some of them may be low because, e.g., *mortality
benefitters* are still alive.

``` r
plot(example_trajs, "summarise", ribbon_percentiles = c(0.25, 0.75))
```

<img src="man/figures/README-unnamed-chunk-9-1.png" width="100%" />

The same scenario specification can, then, be used to simulate a desired
number of trials:

``` r
sims <- do.call(simulate_trials, scenario)
#> 2023-10-04 13:28:11: Estimating ground truth of arm A (0 secs)
#> 2023-10-04 13:28:23: Finished arm 'A' in batch (11.65 secs)
#> 2023-10-04 13:28:23: Estimating ground truth of arm B (11.65 secs)
#> 2023-10-04 13:28:34: Finished arm 'B' in batch (11.87 secs)
#> 2023-10-04 13:28:35: Finished batch (12.16 secs)
#> 2023-10-04 13:28:35: Combining data into final return struct (23.98 secs)
#> 2023-10-04 13:28:35: Wrapping up, returning output (24 secs)
sims
#> $summary_stats
#>                      outcome arm  analysis         p25         p50         p75
#>  1:    primary__hrqol_at_eof   A       all   0.4460350   0.4748150   0.4979300
#>  2:    primary__hrqol_at_eof   B       all   0.4015075   0.4167300   0.4406425
#>  3:       primary__hrqol_auc   A       all  65.1016037  69.1245868  72.7448068
#>  4:       primary__hrqol_auc   B       all  57.7815977  60.1711131  63.2145848
#>  5: secondary1__hrqol_at_eof   A       all   0.4463500   0.4748150   0.4979300
#>  6: secondary1__hrqol_at_eof   B       all   0.4015075   0.4167300   0.4406425
#>  7:    secondary1__hrqol_auc   A       all  65.1718127  69.1450280  72.8792007
#>  8:    secondary1__hrqol_auc   B       all  57.5728169  59.9190753  63.0337151
#>  9: secondary2__hrqol_at_eof   A       all   0.4463500   0.4751850   0.4979300
#> 10: secondary2__hrqol_at_eof   B       all   0.4015075   0.4167300   0.4406425
#> 11:    secondary2__hrqol_auc   A       all  61.1651845  65.2535614  68.3865671
#> 12:    secondary2__hrqol_auc   B       all  54.0907006  56.0916555  59.3521862
#> 13:    primary__hrqol_at_eof   A survivors   0.5567248   0.5869051   0.6090046
#> 14:    primary__hrqol_at_eof   B survivors   0.4964365   0.5151127   0.5372631
#> 15:       primary__hrqol_auc   A survivors  81.3868823  85.8290526  89.0517142
#> 16:       primary__hrqol_auc   B survivors  71.6281198  74.0262050  77.5885824
#> 17: secondary1__hrqol_at_eof   A survivors   0.6631789   0.6851342   0.7054652
#> 18: secondary1__hrqol_at_eof   B survivors   0.5900841   0.6080055   0.6254059
#> 19:    secondary1__hrqol_auc   A survivors  96.6082731 100.1041982 102.8356674
#> 20:    secondary1__hrqol_auc   B survivors  84.5858339  87.5287880  89.8515006
#> 21: secondary2__hrqol_at_eof   A survivors   0.7780358   0.7854113   0.7913703
#> 22: secondary2__hrqol_at_eof   B survivors   0.6897976   0.6960922   0.7017559
#> 23:    secondary2__hrqol_auc   A survivors 106.8054207 107.5461193 108.4934903
#> 24:    secondary2__hrqol_auc   B survivors  93.0185856  93.8269045  94.7945101
#>                      outcome arm  analysis         p25         p50         p75
#>            mean          sd           se
#>  1:   0.4731701 0.033771639 0.0033771639
#>  2:   0.4185806 0.030862069 0.0030862069
#>  3:  69.1468218 4.892519920 0.4892519920
#>  4:  60.3052667 4.363589761 0.4363589761
#>  5:   0.4732429 0.033721267 0.0033721267
#>  6:   0.4185806 0.030862069 0.0030862069
#>  7:  69.1363186 4.898652682 0.4898652682
#>  8:  60.1075714 4.381346215 0.4381346215
#>  9:   0.4733220 0.033729423 0.0033729423
#> 10:   0.4185806 0.030862069 0.0030862069
#> 11:  64.8850589 4.660190014 0.4660190014
#> 12:  56.4429778 4.156057045 0.4156057045
#> 13:   0.5824747 0.035393473 0.0035393473
#> 14:   0.5159788 0.032010054 0.0032010054
#> 15:  85.1250952 5.200096569 0.5200096569
#> 16:  74.3382879 4.501288435 0.4501288435
#> 17:   0.6843284 0.029210800 0.0029210800
#> 18:   0.6080730 0.028233052 0.0028233052
#> 19:  99.9797894 4.348651257 0.4348651257
#> 20:  87.3212845 3.984078449 0.3984078449
#> 21:   0.7843637 0.010666770 0.0010666770
#> 22:   0.6954244 0.009095548 0.0009095548
#> 23: 107.5208910 1.526983119 0.1526983119
#> 24:  93.7769288 1.374818100 0.1374818100
#>            mean          sd           se
#> 
#> $comparisons
#>                     outcome        mean mean_ground_truth         sd
#> 1:    primary__hrqol_at_eof  -0.0545895         -0.076729 0.04845081
#> 2:       primary__hrqol_auc -10.7868073        -12.802088 7.10298282
#> 3: secondary1__hrqol_at_eof  -0.0546623         -0.076729 0.04839718
#> 4:    secondary1__hrqol_auc -12.6585049        -14.772580 6.14791188
#> 5: secondary2__hrqol_at_eof  -0.0547414         -0.076729 0.04841054
#> 6:    secondary2__hrqol_auc -13.7439622        -13.746453 1.89937945
#>             se  analysis comparator target       bias     bias_se relative_bias
#> 1: 0.004845081       all          A      B 0.02213950 0.004845081 -0.2885414902
#> 2: 0.710298282 survivors          A      B 2.01528108 0.710298282 -0.1574181511
#> 3: 0.004839718       all          A      B 0.02206670 0.004839718 -0.2875926964
#> 4: 0.614791188 survivors          A      B 2.11407543 0.614791188 -0.1431080680
#> 5: 0.004841054       all          A      B 0.02198760 0.004841054 -0.2865617954
#> 6: 0.189937945 survivors          A      B 0.00249097 0.189937945 -0.0001812082
#>    relative_bias_se          mse       mse_se coverage coverage_se
#> 1:       0.06314537  0.002814164 0.0003686050     0.95 0.021794495
#> 2:       0.05548300 54.009199182 8.0919130400     0.93 0.025514702
#> 3:       0.06307548  0.002805804 0.0003684904     0.95 0.021794495
#> 4:       0.04161705 41.888167204 5.3951322238     0.94 0.023748684
#> 5:       0.06309289  0.002803599 0.0003686472     0.95 0.021794495
#> 6:       0.01381723  3.571572074 0.5277862727     0.99 0.009949874
#>    bias_corrected_coverage bias_corrected_coverage_se rejection_proportion
#> 1:                    0.97                0.017058722                 0.14
#> 2:                    0.96                0.019595918                 0.30
#> 3:                    0.97                0.017058722                 0.14
#> 4:                    0.96                0.019595918                 0.51
#> 5:                    0.97                0.017058722                 0.14
#> 6:                    0.99                0.009949874                 1.00
#>    rejection_proportion_se n_sim       p25        p50         p75
#> 1:              0.03469870   100  -0.09154  -0.059025  -0.0155550
#> 2:              0.04582576   100 -15.95160 -12.031723  -6.9757454
#> 3:              0.03469870   100  -0.09154  -0.059025  -0.0162975
#> 4:              0.04999000   100 -17.03828 -12.874600  -8.7383204
#> 5:              0.03469870   100  -0.09154  -0.060380  -0.0162975
#> 6:              0.00000000   100 -14.86056 -13.791520 -12.8265296
#> 
#> $args
#> $args$n_trials
#> [1] 100
#> 
#> $args$n_patients_per_arm
#> [1] 100
#> 
#> $args$sampling_frequency
#> [1] 14
#> 
#> $args$n_patients_ground_truth
#> [1] 1000
#> 
#> $args$n_example_trajectories_per_arm
#> [1] 100
#> 
#> $args$arms
#> [1] "A" "B"
#> 
#> $args$first_hrqol
#>   A   B 
#> 0.1 0.1 
#> 
#> $args$final_hrqol
#>   A   B 
#> 0.8 0.7 
#> 
#> $args$acceleration_hrqol
#>   A   B 
#> 0.1 0.0 
#> 
#> $args$mortality
#>   A   B 
#> 0.4 0.4 
#> 
#> $args$mortality_dampening
#> A B 
#> 0 0 
#> 
#> $args$mortality_trajectory_shape
#>           A           B 
#> "exp_decay" "exp_decay" 
#> 
#> $args$prop_mortality_benefitters
#> A B 
#> 0 0 
#> 
#> $args$test_fun
#> welch_t_test
#> 
#> $args$verbose
#> [1] TRUE
#> 
#> $args$n_digits
#> [1] 3
#> 
#> $args$seed
#> [1] -974329927
#> 
#> $args$valid_hrqol_range
#> c(-0.757, 1)
#> 
#> $args$alpha
#> [1] 0.05
#> 
#> 
#> $example_trajectories
#> $arm_level
#>      arm          x         y
#>   1:   A   0.000000 0.0000000
#>   2:   A   5.000000 0.1000000
#>   3:   A   5.006211 0.1100946
#>   4:   A   5.017999 0.1102491
#>   5:   A   5.035294 0.1104958
#>  ---                         
#> 594:   B 186.604774 0.7000000
#> 595:   B 186.762172 0.7000000
#> 596:   B 186.880937 0.7000000
#> 597:   B 186.960426 0.7000000
#> 598:   B 187.000000 0.7000000
#> 
#> $patient_level
#>       arm  id  x     y
#>    1:   A   1  0 0.000
#>    2:   A   1  5    NA
#>    3:   A   2  0 0.000
#>    4:   A   2  3 0.059
#>    5:   A   2 17 0.295
#>   ---                 
#> 2007:   B 199  9 0.063
#> 2008:   B 199 23 0.000
#> 2009:   B 199 27 0.000
#> 2010:   B 200  0 0.000
#> 2011:   B 200 11    NA
#> 
#> attr(,"class")
#> [1] "hrqolr_trajectories" "list"               
#> 
#> $elapsed_time
#> Time difference of 24.26471 secs
#> 
#> attr(,"class")
#> [1] "hrqolr_results" "list"
```

## Issues and enhancements

We use the [GitHub issue
tracker](https://github.com/epiben/hrqolr/issues) for all bug/issue
reports and proposals for enhancements.

## Contributing

We welcome contributions directly to the code to improve performance as
well as new functionality. For the latter, please first explain and
motivate it in an [issue](https://github.com/epiben/hrqolr/issues).

Changes to the code base should follow these steps:

- [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
  the repository
- [Make a
  branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository)
  with an appropriate name in your fork
- Implement changes in your fork, make sure it passes R CMD check (with
  neither errors, warnings, nor notes) and add a bullet at the top of
  NEWS.md with a short description of the change, your GitHub handle and
  the id of the pull request implementing the change (check the
  `NEWS.md` file to see the formatting)
- Create a [pull
  request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork)
  into the `dev` branch of `adaptr`

## Citation

If using the package, please consider citing it:

``` r
citation(package = "hrqolr")
#> To cite package 'hrqolr' in publications use:
#> 
#>   Kaas-Hansen BS, Jensen AKG, Granholm A (2023). hrqolr: an R package
#>   for simulating health-related quality of life trajectories.
#>   https://inceptdk.github.io/hrqolr/
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {{hrqolr}: an R package for simulating health-related quality of life trajectories},
#>     author = {Benjamin Skov Kaas-Hansen and Aksel Karl Georg Jensen and Anders Granholm},
#>     year = {2023},
#>     url = {https://inceptdk.github.io/hrqolr/},
#>   }
```
