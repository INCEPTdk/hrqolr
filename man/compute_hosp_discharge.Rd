% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{compute_hosp_discharge}
\alias{compute_hosp_discharge}
\title{Compute deterministic day of hospital discharge based on day of ICU discharge}
\usage{
compute_hosp_discharge(t_icu_discharge, a, b)
}
\arguments{
\item{t_icu_discharge}{single integer, day of ICU discharge}

\item{a, b}{numeric vectors of length 1, coefficients}
}
\description{
Compute deterministic day of hospital discharge based on day of ICU discharge
}
\keyword{internal}
