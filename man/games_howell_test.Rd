% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/games_howell_test.R
\name{games_howell_test}
\alias{games_howell_test}
\title{Compute p values and confidence intervals a.m. Games Howell}
\usage{
games_howell_test(
  vals,
  grps,
  arms = unique(grps),
  na_replacement = NULL,
  alpha = 0.05
)
}
\arguments{
\item{vals}{numeric vector}

\item{grps}{character vector, allowed values are "ctrl" and "actv" and used to slice \code{x} into two
vectors with values to be compared.}

\item{arms}{character vector with the arms used in the \code{grps} parameter. The first value will be
used as the comparator.}

\item{na_replacement}{scalar (or \code{NULL}), if \code{NULL} missing values will be removed. Otherwise,
missing values will be replaced by the value of \code{na_replacement}}

\item{alpha}{numeric, 1.0 - confidence_level}
}
\value{
A data.table with one row per pairwise comparison and six columns: comparator, target,
estimate (= mean difference), p value as well as lower and upper bounds of the confidence interval
corresponding to the \code{alpha} parameter.
}
\description{
Compute p values and confidence intervals a.m. Games Howell
}
