% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vtn.R
\name{vtn}
\alias{vtn}
\title{Truncated Normal Distribution Variance}
\usage{
vtn(.mean = rep(0, 1), .sd = rep(1, length(.mean)), .low = rep(-Inf,
  length(.mean)), .high = rep(Inf, length(.mean)), .checks = TRUE)
}
\arguments{
\item{.mean}{Length K vector with the means of the K Normal
distributions prior to truncation}

\item{.sd}{Length K vector with the standard deviations of the K Normal
distributions prior to truncation}

\item{.low}{Length K vector with the lower truncation bound of the K
Normal distributions prior to truncation}

\item{.high}{Length K vector with the upper truncation bound of the K
Normal distributions prior to truncation}

\item{.checks}{Length 1 logical vector indicating whether to perform checks
(safer) or not (faster) on the input parameters}
}
\value{
A length K vector of expectations corresponding to the Truncated
Normal distributions. NAs are returned (with a warning) for invalid.
parameter values.
}
\description{
Calculate variance of Truncated Normal distributions
}
\details{
The special values of -Inf and Inf are valid values in the .low and .high
arguments, respectively.
}
\examples{
vtn() ## 1
vtn(0, 1, -Inf, Inf) ## 1
vtn(0, 1, -9999, 9999) ## 1

vtn(0, 1, 0, Inf) ## 0.36338

vtn(0, 1, Inf, -Inf) ## NA with warning

vtn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) ## multiple variances
}
\author{
Jonathan Olmsted
}
