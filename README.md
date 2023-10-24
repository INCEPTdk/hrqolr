
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

- [Website](https://inceptdk.github.io/hrqolr/index.html) - stand-alone
  website with full package documentation
- [Health-related quality of life trajectories in critical illness:
  protocol for a Monte Carlo simulation
  study](https://doi.org/10.1111/aas.14324) - article in Acta
  Anaesthesiologica Scandinavica outlining the first scientific study to
  use `hrqolr`

## Getting started

First, load the package:

``` r
library(hrqolr)
#> Loading 'hrqolr' package v0.0.0.9005.
#> For help, run 'help("hrqolr")' or check out https://inceptdk.github.io/hrqolr/.
```

The preferred way to design a scenario is by using the `setup_scenario`
function to validate the input and give it the right format. Set
`verbose = FALSE` to silence the validation results.

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

`sample_example_trajectories` returns a `ggplot`, allowing you to
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
increasingly few observations some of which might be low:

``` r
plot(example_trajs, "summarise", ribbon_percentiles = c(0.25, 0.75))
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

The same scenario specification can, then, be used to simulate a desired
number of trials. By default `hrqolr` will print progress updates to the
console (silence these with `verbose = FALSE`):

``` r
sims <- simulate_trials(scenario)
#> 2023-10-24 11:07:42: Estimating ground truth of arm 'A' (0 secs)
#> 2023-10-24 11:07:42: Building data.table with patients
#> 2023-10-24 11:07:42: Finding unique patients
#> 2023-10-24 11:07:42: Estimating for 691 unique patients
#> 2023-10-24 11:07:43: Assigning results to all (non-unique) patients
#> 2023-10-24 11:07:43: Starting arm 'A' (1.46 secs)
#> 2023-10-24 11:07:43: Building data.table with patients
#> 2023-10-24 11:07:43: Finding unique patients
#> 2023-10-24 11:07:43: Estimating for 3888 unique patients
#> 2023-10-24 11:07:49: Assigning results to all (non-unique) patients
#> 2023-10-24 11:07:49: Estimating ground truth of arm 'B' (7.36 secs)
#> 2023-10-24 11:07:49: Building data.table with patients
#> 2023-10-24 11:07:49: Finding unique patients
#> 2023-10-24 11:07:49: Estimating for 674 unique patients
#> 2023-10-24 11:07:51: Assigning results to all (non-unique) patients
#> 2023-10-24 11:07:51: Starting arm 'B' (8.83 secs)
#> 2023-10-24 11:07:51: Building data.table with patients
#> 2023-10-24 11:07:51: Finding unique patients
#> 2023-10-24 11:07:51: Estimating for 3825 unique patients
#> 2023-10-24 11:07:56: Assigning results to all (non-unique) patients
#> 2023-10-24 11:07:57: Finished (14.97 secs)
#> 2023-10-24 11:07:57: Sampling example trajectories (15.28 secs)
#> 2023-10-24 11:07:57: Wrapping up, returning output (15.4 secs)
```

The returned object contains quite a lot of interesting information. For
example, summary statistics by arm:

``` r
sims$summary_stats
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
#>  1:    primary__hrqol_at_eof   A       all   0.451   0.472   0.496   0.477 0.037 0.004
#>  2:    primary__hrqol_at_eof   B       all   0.395   0.426   0.444   0.419 0.034 0.003
#>  3:       primary__hrqol_auc   A       all  65.830  69.063  72.747  69.966 5.289 0.529
#>  4:       primary__hrqol_auc   B       all  57.372  61.374  64.210  60.529 4.896 0.490
#>  5: secondary1__hrqol_at_eof   A       all   0.451   0.472   0.496   0.477 0.037 0.004
#>  6: secondary1__hrqol_at_eof   B       all   0.395   0.426   0.444   0.419 0.034 0.003
#>  7:    secondary1__hrqol_auc   A       all  65.798  69.191  72.683  69.892 5.305 0.530
#>  8:    secondary1__hrqol_auc   B       all  57.072  61.154  63.965  60.276 4.910 0.491
#>  9: secondary2__hrqol_at_eof   A       all   0.451   0.472   0.496   0.477 0.037 0.004
#> 10: secondary2__hrqol_at_eof   B       all   0.395   0.426   0.444   0.419 0.034 0.003
#> 11:    secondary2__hrqol_auc   A       all  61.928  64.866  68.202  65.502 5.028 0.503
#> 12:    secondary2__hrqol_auc   B       all  53.323  57.168  59.930  56.461 4.600 0.460
#> 13:    primary__hrqol_at_eof   A survivors   0.562   0.582   0.604   0.584 0.035 0.003
#> 14:    primary__hrqol_at_eof   B survivors   0.487   0.513   0.535   0.512 0.038 0.004
#> 15:       primary__hrqol_auc   A survivors  82.093  85.294  88.846  85.652 5.005 0.500
#> 16:       primary__hrqol_auc   B survivors  70.406  74.157  77.191  73.908 5.366 0.537
#> 17: secondary1__hrqol_at_eof   A survivors   0.666   0.684   0.702   0.684 0.032 0.003
#> 18: secondary1__hrqol_at_eof   B survivors   0.583   0.604   0.625   0.602 0.030 0.003
#> 19:    secondary1__hrqol_auc   A survivors  97.362 100.237 103.171 100.130 4.704 0.470
#> 20:    secondary1__hrqol_auc   B survivors  84.302  86.775  89.883  86.502 4.370 0.437
#> 21: secondary2__hrqol_at_eof   A survivors   0.777   0.785   0.793   0.784 0.010 0.001
#> 22: secondary2__hrqol_at_eof   B survivors   0.690   0.696   0.702   0.695 0.010 0.001
#> 23:    secondary2__hrqol_auc   A survivors 106.464 107.708 108.483 107.540 1.398 0.140
#> 24:    secondary2__hrqol_auc   B survivors  92.786  93.739  94.569  93.536 1.438 0.144
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
```

–and head-to-head comparisons between the arms:

``` r
sims$comparisons
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
#>  1:                 comparator                     A                     A                  A                  A                        A                        A                     A                     A                        A                        A                     A                     A
#>  2:                     target                     B                     B                  B                  B                        B                        B                     B                     B                        B                        B                     B                     B
#>  3:              mean_estimate                -0.058                -0.072             -9.437            -11.744                   -0.058                   -0.082                -9.617               -13.628                   -0.058                   -0.089                -9.041               -14.004
#>  4:          mean_ground_truth                -0.035                -0.035             -6.029             -6.029                   -0.035                   -0.035                 -6.19                 -6.19                   -0.035                   -0.035                -5.895                -5.895
#>  5:                         sd                 0.047                 0.049              6.786              7.127                    0.047                    0.045                 6.817                  6.58                    0.047                    0.014                 6.453                 2.008
#>  6:                         se                 0.005                 0.005              0.679              0.713                    0.005                    0.004                 0.682                 0.658                    0.005                    0.001                 0.645                 0.201
#>  7:                   analysis                   all             survivors                all          survivors                      all                survivors                   all             survivors                      all                survivors                   all             survivors
#>  8:                       bias                -0.023                -0.038             -3.408             -5.715                   -0.023                   -0.047                -3.426                -7.437                   -0.024                   -0.055                -3.146                -8.109
#>  9:                    bias_se                 0.005                 0.005              0.679              0.713                    0.005                    0.004                 0.682                 0.658                    0.005                    0.001                 0.645                 0.201
#> 10:              relative_bias                 0.675                 1.088              0.565              0.948                    0.677                    1.372                 0.553                 1.201                    0.682                    1.581                 0.534                 1.375
#> 11:           relative_bias_se                 0.137                 0.143              0.113              0.118                    0.137                     0.13                  0.11                 0.106                    0.138                    0.041                 0.109                 0.034
#> 12:                        mse                 0.003                 0.004             57.203             82.942                    0.003                    0.004                57.745                98.179                    0.003                    0.003                51.114                69.742
#> 13:                     mse_se                     0                 0.001              7.475             10.888                        0                        0                 7.499                10.488                        0                        0                 6.715                 3.258
#> 14:                   coverage                  0.95                   0.9               0.95               0.91                     0.95                     0.75                  0.95                  0.73                     0.95                      0.1                  0.96                  0.08
#> 15:                coverage_se                 0.022                  0.03              0.022              0.029                    0.022                    0.043                 0.022                 0.044                    0.022                     0.03                  0.02                 0.027
#> 16:    bias_corrected_coverage                     1                     1                  1                  1                        1                        1                     1                     1                        1                        1                     1                     1
#> 17: bias_corrected_coverage_se                     0                     0                  0                  0                        0                        0                     0                     0                        0                        0                     0                     0
#> 18:       rejection_proportion                  0.18                  0.26                0.2                0.3                     0.18                     0.44                  0.23                  0.55                     0.18                        1                  0.22                     1
#> 19:    rejection_proportion_se                 0.038                 0.044               0.04              0.046                    0.038                     0.05                 0.042                  0.05                    0.038                        0                 0.041                     0
#> 20:                      n_sim                   100                   100                100                100                      100                      100                   100                   100                      100                      100                   100                   100
#> 21:                        p25                 -0.09                -0.106            -13.806            -16.554                    -0.09                   -0.121                   -14               -19.093                    -0.09                   -0.099                -13.16                -15.47
#> 22:                        p50                -0.058                -0.072             -9.323            -11.467                   -0.058                   -0.085                -9.573               -13.575                   -0.058                    -0.09                -9.116               -14.121
#> 23:                        p75                -0.033                -0.041             -5.606             -7.545                   -0.033                   -0.051                -5.716                -9.146                   -0.033                   -0.079                -5.563                -12.42
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
GitHub. Doing this requires the *remotes*-package installed. The
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

If using `hrqolr`, please consider citing it:

``` r
citation(package = "hrqolr")
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
