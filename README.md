
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hrqolr <img src="man/figures/hrqolr.png" align="right" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/INCEPTdk/hrqolr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/INCEPTdk/hrqolr/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/INCEPTdk/hrqolr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/INCEPTdk/hrqolr)
<!-- ![total downloads from RStudio mirror](https://cranlogs.r-pkg.org/badges/grand-total/hrqolr) -->
<!-- badges: end -->

Package for simulating randomised clinical trials with temporal
trajectories of health-related quality of life (HRQoL) as the outcome,
to quantify effect sizes as single-sampled HRQoL values at end of
follow-up and as the area under the trajectories.

Developed as part of the INCEPT (Intensive Care Platform Trial) project
(<https://incept.dk/>), which is primarily supported by a grant from
Sygeforsikringen “danmark” (<https://www.sygeforsikring.dk/>).

## Resources

-   [Website](https://inceptdk.github.io/hrqolr/index.html) -
    stand-alone website with full package documentation
-   [Health-related quality of life trajectories in critical illness:
    protocol for a Monte Carlo simulation
    study](https://doi.org/10.1111/aas.14324) - protocol article in Acta
    Anaesthesiologica Scandinavica outlining the first scientific study
    to use `hrqolr`

## Getting started

First, load the package:

``` r
library(hrqolr)
#> Loading 'hrqolr' package v0.0.0.9009.
#> For help, run 'help("hrqolr")' or check out https://inceptdk.github.io/hrqolr.
```

The preferred way to design a scenario is by using the
`setup_scenario()` function to validate the input and give it the right
format. Set `verbose = FALSE` to silence the validation results.

``` r
scenario <- setup_scenario(
    arms = c("A", "B"),
    n_patients = 100,
    sampling_frequency = 14,
    index_hrqol = 0.0,
    first_hrqol = 0.1,
    final_hrqol = c(A = 0.8, B = 0.7),
    acceleration_hrqol = c(A = 1.1, B = 1.0),
    
    mortality = 0.4,
    mortality_dampening = 0.0,
    mortality_trajectory_shape = "exp_decay",
    prop_mortality_benefitters = 0.0,
)
#> arms                         valid as is      
#> n_patients                   modified      100 --> c(A = 100, B = 100)   
#> index_hrqol                  modified      0 --> c(A = 0, B = 0)   
#> first_hrqol                  modified      0.1 --> c(A = 0.1, B = 0.1)   
#> final_hrqol                  valid as is      
#> acceleration_hrqol           valid as is      
#> mortality                    modified      0.4 --> c(A = 0.4, B = 0.4)   
#> mortality_dampening          modified      0 --> c(A = 0, B = 0)   
#> mortality_trajectory_shape   modified      "exp_decay" --> c(A = "exp_decay", B = "exp_decay")   
#> prop_mortality_benefitters   modified      0 --> c(A = 0, B = 0)   
#> sampling_frequency           modified      14 --> c(A = 14, B = 14)
```

Getting an overview of the final scenario:

``` r
scenario
#> arms                                    A           B
#> n_patients                            100         100
#> index_hrqol                             0           0
#> first_hrqol                           0.1         0.1
#> final_hrqol                           0.8         0.7
#> acceleration_hrqol                    1.1           1
#> mortality                             0.4         0.4
#> mortality_dampening                     0           0
#> mortality_trajectory_shape      exp_decay   exp_decay
#> prop_mortality_benefitters              0           0
#> sampling_frequency                     14          14
```

With the scenario at hand, we can sample a number of example
trajectories and visualise them:

``` r
example_trajs <- sample_example_trajectories(scenario, n_digits = 3)
plot(example_trajs)
```

![](man/figures/README-unnamed-chunk-6-1.png)<!-- -->

`sample_example_trajectories` returns a `ggplot` object, allowing you to
fine-tune its appearance for your needs. For example, breaking apart the
trajectories in the arms apart with facets and hide the legend (remember
to load `ggplot2` first). Here, we also set the arm-level trajectory in
black to make it stand out better:

``` r
library(ggplot2) 

plot(example_trajs, arm_aes = list(colour = "black")) +
    facet_wrap(~ arm) +
    theme(legend.position = "none")
```

![](man/figures/README-unnamed-chunk-7-1.png)<!-- -->

You can also summarise the trajectories, e.g., with inter-quartile
ranges. The ribbons become a bit wonky at end of follow-up due to
increasingly fewer observations some of which might be low:

``` r
plot(example_trajs, "summarise", ribbon_percentiles = c(0.25, 0.75))
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

The same scenario specification can, then, be used to simulate a desired
number of trials. By default `hrqolr` will print progress updates to the
console (silence these with `verbose = FALSE`):

``` r
sims <- simulate_trials(scenario)
#> 2023-11-08 11:48:58: Estimating ground truth of arm 'A' (0 secs)
#> 2023-11-08 11:48:58: Building data.table with patients
#> 2023-11-08 11:48:58: Finding unique patients
#> 2023-11-08 11:48:58: Estimating for 687 unique patients
#> 2023-11-08 11:48:59: Assigning results to all (non-unique) patients
#> 2023-11-08 11:48:59: Starting arm 'A' (0.84 secs)
#> 2023-11-08 11:48:59: Building data.table with patients
#> 2023-11-08 11:48:59: Finding unique patients
#> 2023-11-08 11:48:59: Estimating for 3981 unique patients
#> 2023-11-08 11:49:01: Assigning results to all (non-unique) patients
#> 2023-11-08 11:49:01: Estimating ground truth of arm 'B' (3.1 secs)
#> 2023-11-08 11:49:01: Building data.table with patients
#> 2023-11-08 11:49:01: Finding unique patients
#> 2023-11-08 11:49:01: Estimating for 685 unique patients
#> 2023-11-08 11:49:02: Assigning results to all (non-unique) patients
#> 2023-11-08 11:49:02: Starting arm 'B' (3.9 secs)
#> 2023-11-08 11:49:02: Building data.table with patients
#> 2023-11-08 11:49:02: Finding unique patients
#> 2023-11-08 11:49:02: Estimating for 3849 unique patients
#> 2023-11-08 11:49:04: Assigning results to all (non-unique) patients
#> 2023-11-08 11:49:05: Finished (6.52 secs)
#> 2023-11-08 11:49:05: Sampling example trajectories (6.83 secs)
#> 2023-11-08 11:49:05: Wrapping up, returning output (7.28 secs)
```

The returned object contains quite a lot of interesting information. For
example, summary statistics by arm:

``` r
sims$summary_stats
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
#>  1:    primary__hrqol_at_eof   A       all   0.454   0.482   0.507   0.481 0.036 0.004
#>  2:    primary__hrqol_at_eof   B       all   0.391   0.416   0.441   0.416 0.036 0.004
#>  3:       primary__hrqol_auc   A       all  66.990  70.572  74.152  70.549 5.405 0.541
#>  4:       primary__hrqol_auc   B       all  56.491  60.167  63.798  60.043 5.143 0.514
#>  5: secondary1__hrqol_at_eof   A       all   0.457   0.482   0.507   0.481 0.036 0.004
#>  6: secondary1__hrqol_at_eof   B       all   0.391   0.418   0.441   0.416 0.036 0.004
#>  7:    secondary1__hrqol_auc   A       all  66.819  70.416  74.053  70.409 5.399 0.540
#>  8:    secondary1__hrqol_auc   B       all  56.369  59.933  63.538  59.854 5.163 0.516
#>  9: secondary2__hrqol_at_eof   A       all   0.457   0.482   0.507   0.481 0.036 0.004
#> 10: secondary2__hrqol_at_eof   B       all   0.391   0.418   0.441   0.416 0.036 0.004
#> 11:    secondary2__hrqol_auc   A       all  62.475  65.984  69.612  65.988 4.991 0.499
#> 12:    secondary2__hrqol_auc   B       all  52.653  56.408  59.554  56.119 4.857 0.486
#> 13:    primary__hrqol_at_eof   A survivors   0.560   0.593   0.612   0.588 0.034 0.003
#> 14:    primary__hrqol_at_eof   B survivors   0.482   0.510   0.537   0.510 0.036 0.004
#> 15:       primary__hrqol_auc   A survivors  82.389  86.856  89.735  86.308 5.054 0.505
#> 16:       primary__hrqol_auc   B survivors  69.626  73.588  77.250  73.602 5.265 0.527
#> 17: secondary1__hrqol_at_eof   A survivors   0.668   0.701   0.716   0.694 0.030 0.003
#> 18: secondary1__hrqol_at_eof   B survivors   0.588   0.610   0.625   0.609 0.025 0.003
#> 19:    secondary1__hrqol_auc   A survivors  98.201 102.612 104.352 101.581 4.472 0.447
#> 20:    secondary1__hrqol_auc   B survivors  84.657  87.550  90.132  87.488 3.761 0.376
#> 21: secondary2__hrqol_at_eof   A survivors   0.787   0.794   0.802   0.794 0.010 0.001
#> 22: secondary2__hrqol_at_eof   B survivors   0.689   0.694   0.700   0.694 0.009 0.001
#> 23:    secondary2__hrqol_auc   A survivors 107.845 109.012 109.967 108.899 1.391 0.139
#> 24:    secondary2__hrqol_auc   B survivors  92.712  93.588  94.441  93.559 1.324 0.132
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
```

–and head-to-head comparisons between the arms:

``` r
sims$comparisons
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
#>  1:                 comparator                     A                     A                  A                  A                        A                        A                     A                     A                        A                        A                     A                     A
#>  2:                     target                     B                     B                  B                  B                        B                        B                     B                     B                        B                        B                     B                     B
#>  3:              mean_estimate                -0.065                -0.078            -10.506            -12.705                   -0.065                   -0.085               -10.556               -14.093                   -0.065                   -0.099                -9.869                -15.34
#>  4:          mean_ground_truth                -0.085                -0.085            -13.541            -13.541                   -0.085                   -0.085               -13.568               -13.568                   -0.085                   -0.085               -12.608               -12.608
#>  5:                         sd                 0.053                 0.048              7.694              7.006                    0.053                    0.037                 7.704                  5.57                    0.053                    0.014                 7.205                 1.857
#>  6:                         se                 0.005                 0.005              0.769              0.701                    0.005                    0.004                  0.77                 0.557                    0.005                    0.001                 0.721                 0.186
#>  7:                   analysis                   all             survivors                all          survivors                      all                survivors                   all             survivors                      all                survivors                   all             survivors
#>  8:                       bias                  0.02                 0.006              3.035              0.835                     0.02                   -0.001                 3.012                -0.525                     0.02                   -0.015                 2.739                -2.731
#>  9:                    bias_se                 0.005                 0.005              0.769              0.701                    0.005                    0.004                  0.77                 0.557                    0.005                    0.001                 0.721                 0.186
#> 10:              relative_bias                -0.235                -0.076             -0.224             -0.062                   -0.237                    0.008                -0.222                 0.039                   -0.237                    0.176                -0.217                 0.217
#> 11:           relative_bias_se                 0.063                 0.057              0.057              0.052                    0.063                    0.044                 0.057                 0.041                    0.063                    0.016                 0.057                 0.015
#> 12:                        mse                 0.003                 0.002              67.81             49.286                    0.003                    0.001                67.826                30.987                    0.003                        0                58.899                10.873
#> 13:                     mse_se                     0                     0              8.055              7.257                        0                        0                 8.071                 4.117                        0                        0                 7.094                 1.118
#> 14:                   coverage                  0.94                  0.95               0.93               0.96                     0.94                     0.98                  0.93                  0.98                     0.94                     0.78                  0.94                  0.74
#> 15:                coverage_se                 0.024                 0.022              0.026               0.02                    0.024                    0.014                 0.026                 0.014                    0.024                    0.041                 0.024                 0.044
#> 16:    bias_corrected_coverage                     1                     1                  1                  1                        1                        1                     1                     1                        1                        1                     1                     1
#> 17: bias_corrected_coverage_se                     0                     0                  0                  0                        0                        0                     0                     0                        0                        0                     0                     0
#> 18:       rejection_proportion                  0.25                   0.3               0.29               0.39                     0.24                     0.51                  0.31                  0.62                     0.24                        1                  0.31                     1
#> 19:    rejection_proportion_se                 0.043                 0.046              0.045              0.049                    0.043                     0.05                 0.046                 0.049                    0.043                        0                 0.046                     0
#> 20:                      n_sim                   100                   100                100                100                      100                      100                   100                   100                      100                      100                   100                   100
#> 21:                        p25                -0.104                 -0.11            -15.589            -17.582                   -0.103                    -0.11               -15.734               -17.572                   -0.103                   -0.108               -15.016               -16.477
#> 22:                        p50                -0.066                 -0.08            -10.694            -12.974                   -0.066                   -0.088                -10.65               -14.506                   -0.066                     -0.1                -9.931               -15.379
#> 23:                        p75                 -0.03                -0.048             -5.391             -8.263                    -0.03                   -0.063                -5.511               -11.065                    -0.03                    -0.09                -4.983               -14.079
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
```

## Installation

`hrqolr` isn’t on CRAN yet but can be installed from GitHub if you have
the `remotes` package installed:

``` r
# install.packages("remotes") 
remotes::install_github("INCEPTdk/hrqolr")
```

You can also install the **development version** from directly from
GitHub. Doing this requires the `remotes` package installed. The
development version may contain additional features not yet available in
the stable CRAN version, but may be unstable or lack documentation.

``` r
remotes::install_github("INCEPTdk/hrqolr@dev")
```

## Issues and enhancements

We use the [GitHub issue
tracker](https://github.com/INCEPTdk/hrqolr/issues) for all bug/issue
reports and proposals for enhancements.

## Contributing

We welcome contributions directly to the code to improve performance as
well as new functionality. For the latter, please first explain and
motivate it in an [issue](https://github.com/INCEPTdk/hrqolr/issues).

Changes to the code base should follow these steps:

-   [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
    the repository
-   [Make a
    branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-and-deleting-branches-within-your-repository)
    with an appropriate name in your fork
-   Implement changes in your fork, make sure it passes R CMD check
    (with neither errors, warnings, nor notes) and add a bullet at the
    top of NEWS.md with a short description of the change, your GitHub
    handle and the id of the pull request implementing the change (check
    the `NEWS.md` file to see the formatting)
-   Create a [pull
    request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork)
    into the `dev` branch of `adaptr`

## Citation

If using `hrqolr`, please consider citing it:

``` r
citation(package = "hrqolr")
#> 
#> To cite package 'hrqolr' in publications use:
#> 
#>   Kaas-Hansen BS, Granholm A (2023). hrqolr: an R package for
#>   simulating health-related quality of life trajectories.
#>   https://inceptdk.github.io/hrqolr/
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {{hrqolr}: an R package for simulating health-related quality of life trajectories},
#>     author = {Benjamin Skov Kaas-Hansen and Anders Granholm},
#>     year = {2023},
#>     url = {https://inceptdk.github.io/hrqolr/},
#>   }
```
