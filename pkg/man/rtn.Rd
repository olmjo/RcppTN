\name{rtn}
\alias{rtn}
\title{
  Draw from a Truncated Normal Distribution.
}
\description{
  Returns a vector of draws from the user-provided sequence of Truncated
  Normal distributions. The implementation is that from Robert
  (1995). The computation is written in Rcpp-based C++ code, but
  respects R's RNG state.  
}
\usage{
rtn(.mean = rep(0, 1),
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

\details{ The draws from this function are reproducible because it
  respects R's RNG state. Draws using this algorithm (whether
  implemented in R code or C++) will be the same if seeded
  correctly. However, you should not expect these draws to match those
  from another algorithm.


}

\value{
  A \verb{numeric} vector of length \eqn{K} containing the draws from each of the
  (possibly different) \eqn{K} distributions.
}

\examples{
library(RcppTN)
set.seed(1)
rtn(0, 1, -Inf, Inf) # single draw from a single distribution

## [1] -0.6264538

set.seed(1)
rtn(0, 1, -Inf, Inf) # again, because it respects the RNG state

## [1] -0.6264538

rtn(rep(0, 3),
    rep(1, 3),
    rep(-Inf, 3),
    rep(Inf, 3)
    ) # multiple draws from a single distribution

## [1]  0.1836433 -0.8356286  1.5952808

rtn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) # multiple draws, each from a different distribution
## [1] 0.3295078 5.3917301
}

\references{
  Robert, Christian P. ``Simulation of truncated normal
  variables''. Statistics and Computing 5.2 (1995):
  121-125. \url{http://dx.doi.org/10.1007/BF00143942}
}
