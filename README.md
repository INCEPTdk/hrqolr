
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
#> Loading 'hrqolr' package v0.0.0.9009.
#> For help, run 'help("hrqolr")' or check out https://inceptdk.github.io/hrqolr.
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
#> 2023-11-08 10:51:22: Estimating ground truth of arm 'A' (0 secs)
#> 2023-11-08 10:51:22: Building data.table with patients
#> 2023-11-08 10:51:22: Finding unique patients
#> 2023-11-08 10:51:22: Estimating for 685 unique patients
#> 2023-11-08 10:51:22: Assigning results to all (non-unique) patients
#> 2023-11-08 10:51:22: Starting arm 'A' (0.33 secs)
#> 2023-11-08 10:51:22: Building data.table with patients
#> 2023-11-08 10:51:22: Finding unique patients
#> 2023-11-08 10:51:22: Estimating for 4039 unique patients
#> 2023-11-08 10:51:23: Assigning results to all (non-unique) patients
#> 2023-11-08 10:51:23: Estimating ground truth of arm 'B' (1.4 secs)
#> 2023-11-08 10:51:23: Building data.table with patients
#> 2023-11-08 10:51:23: Finding unique patients
#> 2023-11-08 10:51:23: Estimating for 680 unique patients
#> 2023-11-08 10:51:23: Assigning results to all (non-unique) patients
#> 2023-11-08 10:51:23: Starting arm 'B' (1.77 secs)
#> 2023-11-08 10:51:23: Building data.table with patients
#> 2023-11-08 10:51:23: Finding unique patients
#> 2023-11-08 10:51:23: Estimating for 3853 unique patients
#> 2023-11-08 10:51:24: Assigning results to all (non-unique) patients
#> 2023-11-08 10:51:25: Finished (3 secs)
#> 2023-11-08 10:51:25: Sampling example trajectories (3.21 secs)
#> 2023-11-08 10:51:25: Wrapping up, returning output (3.4 secs)
```

The returned object contains quite a lot of interesting information. For
example, summary statistics by arm:

``` r
sims$summary_stats
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
#>  1:    primary__hrqol_at_eof   A       all   0.448   0.475   0.494   0.472 0.037 0.004
#>  2:    primary__hrqol_at_eof   B       all   0.401   0.425   0.447   0.420 0.036 0.004
#>  3:       primary__hrqol_auc   A       all  66.132  69.779  73.083  69.440 5.506 0.551
#>  4:       primary__hrqol_auc   B       all  57.658  61.374  64.206  60.524 5.081 0.508
#>  5: secondary1__hrqol_at_eof   A       all   0.448   0.475   0.494   0.472 0.037 0.004
#>  6: secondary1__hrqol_at_eof   B       all   0.401   0.425   0.447   0.420 0.036 0.004
#>  7:    secondary1__hrqol_auc   A       all  65.881  69.564  72.832  69.280 5.500 0.550
#>  8:    secondary1__hrqol_auc   B       all  57.430  61.067  64.072  60.326 5.117 0.512
#>  9: secondary2__hrqol_at_eof   A       all   0.448   0.475   0.494   0.472 0.037 0.004
#> 10: secondary2__hrqol_at_eof   B       all   0.401   0.425   0.447   0.420 0.036 0.004
#> 11:    secondary2__hrqol_auc   A       all  61.424  65.065  67.947  64.753 5.093 0.509
#> 12:    secondary2__hrqol_auc   B       all  53.821  57.377  60.239  56.630 4.838 0.484
#> 13:    primary__hrqol_at_eof   A survivors   0.558   0.588   0.605   0.580 0.036 0.004
#> 14:    primary__hrqol_at_eof   B survivors   0.488   0.512   0.537   0.514 0.035 0.004
#> 15:       primary__hrqol_auc   A survivors  82.035  86.331  89.086  85.372 5.391 0.539
#> 16:       primary__hrqol_auc   B survivors  70.662  73.486  77.129  74.046 5.038 0.504
#> 17: secondary1__hrqol_at_eof   A survivors   0.666   0.694   0.712   0.690 0.032 0.003
#> 18: secondary1__hrqol_at_eof   B survivors   0.585   0.608   0.632   0.606 0.032 0.003
#> 19:    secondary1__hrqol_auc   A survivors  98.154 101.421 104.235 101.262 4.697 0.470
#> 20:    secondary1__hrqol_auc   B survivors  84.174  86.819  90.873  86.976 4.577 0.458
#> 21: secondary2__hrqol_at_eof   A survivors   0.787   0.796   0.803   0.794 0.012 0.001
#> 22: secondary2__hrqol_at_eof   B survivors   0.688   0.697   0.704   0.696 0.011 0.001
#> 23:    secondary2__hrqol_auc   A survivors 107.631 109.121 110.193 108.891 1.808 0.181
#> 24:    secondary2__hrqol_auc   B survivors  92.629  94.007  94.900  93.843 1.534 0.153
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
```

–and head-to-head comparisons between the arms:

``` r
sims$comparisons
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
#>  1:                 comparator                     A                     A                  A                  A                        A                        A                     A                     A                        A                        A                     A                     A
#>  2:                     target                     B                     B                  B                  B                        B                        B                     B                     B                        B                        B                     B                     B
#>  3:              mean_estimate                -0.052                -0.067             -8.916            -11.326                   -0.052                   -0.085                -8.954               -14.286                   -0.052                   -0.098                -8.122               -15.048
#>  4:          mean_ground_truth                -0.068                -0.068            -11.252            -11.252                   -0.068                   -0.068               -11.231               -11.231                   -0.068                   -0.068               -10.541               -10.541
#>  5:                         sd                 0.053                 0.049               7.65               7.17                    0.053                    0.044                 7.658                 6.376                    0.053                    0.016                 7.217                  2.27
#>  6:                         se                 0.005                 0.005              0.765              0.717                    0.005                    0.004                 0.766                 0.638                    0.005                    0.002                 0.722                 0.227
#>  7:                   analysis                   all             survivors                all          survivors                      all                survivors                   all             survivors                      all                survivors                   all             survivors
#>  8:                       bias                 0.016                 0.001              2.336             -0.074                    0.016                   -0.017                 2.277                -3.055                    0.016                    -0.03                 2.419                -4.506
#>  9:                    bias_se                 0.005                 0.005              0.765              0.717                    0.005                    0.004                 0.766                 0.638                    0.005                    0.002                 0.722                 0.227
#> 10:              relative_bias                -0.232                -0.017             -0.208              0.007                   -0.231                    0.248                -0.203                 0.272                   -0.231                    0.445                -0.229                 0.427
#> 11:           relative_bias_se                 0.078                 0.072              0.068              0.064                    0.078                    0.065                 0.068                 0.057                    0.078                    0.023                 0.068                 0.022
#> 12:                        mse                 0.003                 0.002             63.394             50.905                    0.003                    0.002                63.245                49.574                    0.003                    0.001                57.413                25.405
#> 13:                     mse_se                     0                     0              10.54              8.138                        0                        0                10.494                 7.387                        0                        0                 9.308                 2.108
#> 14:                   coverage                  0.95                  0.97               0.95               0.97                     0.95                     0.92                  0.95                  0.93                     0.95                     0.37                  0.95                  0.37
#> 15:                coverage_se                 0.022                 0.017              0.022              0.017                    0.022                    0.027                 0.022                 0.026                    0.022                    0.048                 0.022                 0.048
#> 16:    bias_corrected_coverage                     1                     1                  1                  1                        1                        1                     1                     1                        1                        1                     1                     1
#> 17: bias_corrected_coverage_se                     0                     0                  0                  0                        0                        0                     0                     0                        0                        0                     0                     0
#> 18:       rejection_proportion                  0.19                  0.22               0.23               0.34                     0.19                     0.47                  0.24                  0.55                     0.19                        1                  0.24                     1
#> 19:    rejection_proportion_se                 0.039                 0.041              0.042              0.047                    0.039                     0.05                 0.043                  0.05                    0.039                        0                 0.043                     0
#> 20:                      n_sim                   100                   100                100                100                      100                      100                   100                   100                      100                      100                   100                   100
#> 21:                        p25                 -0.09                -0.103            -14.319            -16.327                    -0.09                   -0.112               -14.437               -19.034                    -0.09                   -0.109               -13.451               -16.577
#> 22:                        p50                -0.051                -0.073             -9.063            -12.214                   -0.051                   -0.085                -9.084               -14.073                   -0.051                   -0.098                -7.745               -15.191
#> 23:                        p75                -0.018                -0.038             -4.377             -6.766                   -0.017                   -0.053                -4.389                -9.717                   -0.017                   -0.086                -3.701               -13.572
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
