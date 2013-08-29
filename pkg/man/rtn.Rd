\name{rtn}
\alias{rtn}
\title{
  Draw from a Truncated Normal Distribution.
}
\description{

}
\usage{
rtn(.mean = rep(0, 1),
    .sd = rep(1, length(.mean)),
    .low =rep(-Inf, length(.mean)),
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
  lower bound
}
}

\examples{
set.seed(1)
rtn(0, 1, -Inf, Inf) ## for a single draw from a single distribution

rtn(rep(0, 3),
    rep(1, 3),
    rep(-Inf, 3),
    rep(Inf, 3)
    ) ## for multiple draws from a single distribution

rtn(c(0, 0),
    c(1, 1),
    c(-Inf, 5),
    c(1, Inf)
    ) ## multiple draws, each from a different distribution
}
