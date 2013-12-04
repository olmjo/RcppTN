\name{vtn}
\alias{vtn}
\title{
  Calculate Variance of a Truncated Normal Distribution.
}
\description{
  Returns a vector of variancs from the user-provided sequence of Truncated
  Normal distributions.
}
\usage{
vtn(.mean = rep(0, 1),
    .sd = rep(1, length(.mean)),
    .low = rep(-Inf, length(.mean)),
    .high = rep(Inf, length(.mean))
    )
}
\arguments{
\item{.mean}{vector of length \eqn{K}, with each element \eqn{k} containing the
  mean of the \eqn{k}th truncated normal distribution
}
\item{.sd}{
  vector of length \eqn{K}, with each element \eqn{k} containing the
  standard deviation of the \eqn{k}th truncated normal distribution
}
\item{.low}{
  vector of length \eqn{K}, with each element \eqn{k} containing the
  lower bound of the \eqn{k}th truncated normal distribution, -Inf is a
  valid value for the lower bound
}
\item{.high}{
  vector of length \eqn{K}, with each element \eqn{k} containing the
  upper bound of the \eqn{k}th distribution, Inf is a valid value for the
  upper bound
}
}

\value{ A \verb{numeric} vector of length \eqn{K} containing the
  calculations from each of the (possibly different) \eqn{K}
  distributions. NAs are returned (with a warning) for invalid parameter
  values. If the input vector lengths disagree, an error is returned.}

\examples{
library(RcppTN)
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
