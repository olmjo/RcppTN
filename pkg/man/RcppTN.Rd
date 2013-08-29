\name{RcppTN-package}
\alias{RcppTN-package}
\alias{RcppTN}
\docType{package}
\title{
Truncated Normal Distribution RNG
}
\description{
This package provides an R function to generate random deviates
from a Truncated Normal distribution using the Robert (1995)
algorithm. No d/p/q functions are provided. See the \verb{\link{truncnorm}}
package for these facilities.
}


\details{
\tabular{ll}{
Package: \tab RcppTN\cr
Type: \tab Package\cr
Version: \tab 0.1-0\cr
Date: \tab 2013-08-29\cr
License: \tab GPL (>=2)\cr

While an R-level function to produce a vector of draws corresponding to
an arbitrary set of distributions is provided, \code{\link{rtn}}, the main
purpose of this R package is to provide a truncated Normal distribution
RNG for other Rcpp-based projects that respects R's RNG state.
}


}

\author{
Jonathan Olmsted

Maintainer: Jonathan Olmsted \email{jpolmsted@gmail.com}
}

\references{
  Robert, Christian P. ``Simulation of truncated normal
  variables''. Statistics and Computing 5.2 (1995):
  121-125. \url{http://dx.doi.org/10.1007/BF00143942}
}
\keyword{ package }
\keyword{ distribution }