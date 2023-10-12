
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hrqolr <img src="man/figures/hrqolr.png" align="right" width="120" />

<!-- badges: start -->

![Version](https://img.shields.io/badge/version-0.0.0.9002-informational.svg)
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

First, load the package:

``` r
library(hrqolr)
#> Loading 'hrqolr' package v0.0.0.9001.
#> For help, run 'help("hrqolr")' or check out https://inceptdk.github.io/hrqolr/.
#> Consider running 'cache_hrqolr()' for faster simulations. If you have enough RAM, 
#> increasing the cache size might speed up things even more; run '?cache_hrqolr' for details.
```

–then, we activate the cache. This is optional but highly recommended.

``` r
cache_hrqolr()
```

`hrqolr` was built to simulate many scenarios, but here we define a
single scenario with the built-in helper `setup_scenario` (note the
validation results printed–silence these with `verbose = FALSE`):

``` r
scenario <- setup_scenario(
    arms = c("A", "B"),
    n_patients = 100,
    sampling_frequency = 14,
    index_hrqol = 0.0,
    first_hrqol = 0.1,
    final_hrqol = c(A = 0.8, B = 0.7),
    acceleration_hrqol = c(A = 0.1, B = 0.0),
    
    mortality = 0.4,
    mortality_dampening = 0.0,
    mortality_trajectory_shape = "exp_decay",
    prop_mortality_benefitters = 0.0,
)
#> arms                         valid as is      
#> n_patients                   modified      100 --> c("A" = 100, "B" = 100)   
#> index_hrqol                  modified      0 --> c("A" = 0, "B" = 0)   
#> first_hrqol                  modified      0.1 --> c("A" = 0.1, "B" = 0.1)   
#> final_hrqol                  valid as is      
#> acceleration_hrqol           valid as is      
#> mortality                    modified      0.4 --> c("A" = 0.4, "B" = 0.4)   
#> mortality_dampening          modified      0 --> c("A" = 0, "B" = 0)   
#> mortality_trajectory_shape   modified      "exp_decay" --> c("A" = "exp_decay", "B" = "exp_decay")   
#> prop_mortality_benefitters   modified      0 --> c("A" = 0, "B" = 0)   
#> sampling_frequency           modified      14 --> c("A" = 14, "B" = 14)
```

Getting an overview of the final scenario:

``` r
scenario
#> arms                                    A           B
#> n_patients                            100         100
#> index_hrqol                             0           0
#> first_hrqol                           0.1         0.1
#> final_hrqol                           0.8         0.7
#> acceleration_hrqol                    0.1           0
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

![](man/figures/README-unnamed-chunk-9-1.png)<!-- -->

You might also want to break apart the trajectories in the arms using
well-known `ggplot2` facets (but we need to load `ggplot2` first).
Hiding the legend, then, makes sense as the facet strips will already
provide the same information. Here, we also set the arm-level trajectory
in black to set it apart from the individual patient trajectories:

``` r
library(ggplot2) 

plot(example_trajs, arm_aes = list(colour = "black")) +
    facet_wrap(~ arm) +
    theme(legend.position = "none")
```

![](man/figures/README-unnamed-chunk-10-1.png)<!-- -->

Of course, we might also be interested in summarising the trajectories.
Here, for example, with inter-quartile ranges. Note that the ribbons
become a bit wonky at end of follow-up because there are increasingly
few observations, and some of them may be low because, e.g., *mortality
benefitters* are still alive.

``` r
plot(example_trajs, "summarise", ribbon_percentiles = c(0.25, 0.75))
```

![](man/figures/README-unnamed-chunk-11-1.png)<!-- -->

The same scenario specification can, then, be used to simulate a desired
number of trials. By default `hrqolr` will print progress updates to the
console (hide these with `verbose = FALSE`):

``` r
sims <- simulate_trials(scenario)
#> 2023-10-12 14:24:06: Estimating ground truth of arm A (0 secs)
#> 2023-10-12 14:24:12: Finished arm 'A' in batch (6.61 secs)
#> 2023-10-12 14:24:13: Estimating ground truth of arm B (6.7 secs)
#> 2023-10-12 14:24:19: Finished arm 'B' in batch (6.53 secs)
#> 2023-10-12 14:24:20: Finished batch (7.29 secs)
#> 2023-10-12 14:24:20: Combining data into final return struct (14.1 secs)
#> 2023-10-12 14:24:20: Sampling example trajectories (14.49 secs)
#> 2023-10-12 14:24:21: Wrapping up, returning output (14.7 secs)
```

The `sims` object contains quite a lot of interesting information.
Perhaps the useful are the summary statistics by arm and head-to-head
comparisons between the arms

``` r
sims$summary_stats
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
#>  1:    primary__hrqol_at_eof   A       all   0.456   0.476   0.507   0.482 0.042 0.004
#>  2:    primary__hrqol_at_eof   B       all   0.401   0.422   0.446   0.423 0.034 0.003
#>  3:       primary__hrqol_auc   A       all  66.823  69.830  73.935  70.623 6.132 0.613
#>  4:       primary__hrqol_auc   B       all  57.753  60.547  63.952  60.988 4.869 0.487
#>  5: secondary1__hrqol_at_eof   A       all   0.456   0.476   0.507   0.482 0.042 0.004
#>  6: secondary1__hrqol_at_eof   B       all   0.401   0.422   0.446   0.423 0.034 0.003
#>  7:    secondary1__hrqol_auc   A       all  66.674  69.681  73.897  70.538 6.134 0.613
#>  8:    secondary1__hrqol_auc   B       all  57.582  60.265  63.709  60.749 4.873 0.487
#>  9: secondary2__hrqol_at_eof   A       all   0.456   0.476   0.507   0.482 0.042 0.004
#> 10: secondary2__hrqol_at_eof   B       all   0.401   0.422   0.446   0.423 0.034 0.003
#> 11:    secondary2__hrqol_auc   A       all  62.710  65.321  69.572  66.197 5.731 0.573
#> 12:    secondary2__hrqol_auc   B       all  54.123  56.568  60.007  56.955 4.526 0.453
#> 13:    primary__hrqol_at_eof   A survivors   0.568   0.593   0.618   0.591 0.040 0.004
#> 14:    primary__hrqol_at_eof   B survivors   0.494   0.515   0.548   0.519 0.036 0.004
#> 15:       primary__hrqol_auc   A survivors  83.115  86.806  90.532  86.505 5.891 0.589
#> 16:       primary__hrqol_auc   B survivors  71.581  74.143  78.838  74.746 5.136 0.514
#> 17: secondary1__hrqol_at_eof   A survivors   0.673   0.693   0.714   0.693 0.034 0.003
#> 18: secondary1__hrqol_at_eof   B survivors   0.589   0.608   0.631   0.608 0.033 0.003
#> 19:    secondary1__hrqol_auc   A survivors  98.538 101.344 104.176 101.349 4.950 0.495
#> 20:    secondary1__hrqol_auc   B survivors  84.521  87.294  90.416  87.278 4.783 0.478
#> 21: secondary2__hrqol_at_eof   A survivors   0.780   0.787   0.793   0.785 0.011 0.001
#> 22: secondary2__hrqol_at_eof   B survivors   0.692   0.697   0.702   0.696 0.008 0.001
#> 23:    secondary2__hrqol_auc   A survivors 107.050 107.997 108.751 107.680 1.594 0.159
#> 24:    secondary2__hrqol_auc   B survivors  92.928  93.729  94.464  93.722 1.137 0.114
#>                      outcome arm  analysis     p25     p50     p75    mean    sd    se
```

``` r
sims$comparisons
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
#>  1:                 comparator                     A                     A                  A                  A                        A                        A                     A                     A                        A                        A                     A                     A
#>  2:                     target                     B                     B                  B                  B                        B                        B                     B                     B                        B                        B                     B                     B
#>  3:              mean_estimate                -0.059                -0.072             -9.635            -11.758                   -0.059                   -0.085                -9.788               -14.071                   -0.059                   -0.088                -9.242               -13.958
#>  4:          mean_ground_truth                -0.041                -0.041             -7.134             -7.134                   -0.041                   -0.041                -7.214                -7.214                   -0.041                   -0.041                -6.798                -6.798
#>  5:                         sd                 0.052                 0.053              7.436              7.728                    0.051                    0.046                 7.458                 6.659                    0.052                    0.014                 6.986                 1.985
#>  6:                         se                 0.005                 0.005              0.744              0.773                    0.005                    0.005                 0.746                 0.666                    0.005                    0.001                 0.699                 0.199
#>  7:                   analysis                   all             survivors                all          survivors                      all                survivors                   all             survivors                      all                survivors                   all             survivors
#>  8:                       bias                -0.018                -0.031             -2.501             -4.625                   -0.018                   -0.044                -2.574                -6.856                   -0.018                   -0.047                -2.444                 -7.16
#>  9:                    bias_se                 0.005                 0.005              0.744              0.773                    0.005                    0.005                 0.746                 0.666                    0.005                    0.001                 0.699                 0.199
#> 10:              relative_bias                 0.443                  0.76              0.351              0.648                    0.445                    1.078                 0.357                  0.95                    0.446                    1.157                  0.36                 1.053
#> 11:           relative_bias_se                 0.126                 0.131              0.104              0.108                    0.126                    0.112                 0.103                 0.092                    0.126                    0.035                 0.103                 0.029
#> 12:                        mse                 0.003                 0.004             60.994             80.516                    0.003                    0.004                61.695                90.915                    0.003                    0.002                54.291                55.173
#> 13:                     mse_se                     0                     0              8.772             10.351                        0                    0.001                 8.857                11.496                        0                        0                 7.817                 2.676
#> 14:                   coverage                  0.92                  0.91               0.92                0.9                     0.92                      0.8                  0.92                   0.8                     0.92                     0.13                  0.92                  0.12
#> 15:                coverage_se                 0.027                 0.029              0.027               0.03                    0.027                     0.04                 0.027                  0.04                    0.027                    0.034                 0.027                 0.032
#> 16:    bias_corrected_coverage                  0.92                  0.94               0.95               0.95                     0.92                     0.94                  0.94                  0.94                     0.92                     0.97                  0.95                  0.99
#> 17: bias_corrected_coverage_se                 0.027                 0.024              0.022              0.022                    0.027                    0.024                 0.024                 0.024                    0.027                    0.017                 0.022                  0.01
#> 18:       rejection_proportion                   0.2                  0.27               0.25               0.35                      0.2                     0.51                  0.25                   0.6                      0.2                        1                  0.25                     1
#> 19:    rejection_proportion_se                  0.04                 0.044              0.043              0.048                     0.04                     0.05                 0.043                 0.049                     0.04                        0                 0.043                     0
#> 20:                      n_sim                   100                   100                100                100                      100                      100                   100                   100                      100                      100                   100                   100
#> 21:                        p25                -0.092                -0.103             -14.15            -16.666                   -0.092                   -0.121               -14.192               -18.803                   -0.092                   -0.096                -13.74               -15.253
#> 22:                        p50                -0.056                -0.074             -9.476            -12.121                   -0.056                    -0.08                -9.582               -13.541                   -0.056                   -0.089                -8.686               -14.112
#> 23:                        p75                -0.021                -0.042             -3.545             -7.112                   -0.021                   -0.053                -3.596                -9.857                   -0.021                   -0.082                -3.754               -12.977
#>                      statistic primary__hrqol_at_eof primary__hrqol_at_eof primary__hrqol_auc primary__hrqol_auc secondary1__hrqol_at_eof secondary1__hrqol_at_eof secondary1__hrqol_auc secondary1__hrqol_auc secondary2__hrqol_at_eof secondary2__hrqol_at_eof secondary2__hrqol_auc secondary2__hrqol_auc
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
