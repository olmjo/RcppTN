# RcppTN

Rcpp-based Truncated Normal RNG by Jonathan Olmsted (jpolmsted@gmail.com)

This package provides functions for generating random numbers from a Truncated
Normal distribution with integration to R's usual RNG seed. Functions can be
called at either the R or C++ level (with similar structures).

In addition to RNG, functions to calculate the density, moments of the
distribution, and the entropy are also provided.

The goal of this package is to provide consistent and straightforward functions
for working with Truncated Normal distributions for users in R-land and C++-land.


## Installation

Using `install_github()` from the `devtools` package will install this for
you. Alternatively, you could clone this repository and build/install with the
Makefile that is included.

```
library(devtools)
install_github(repo = "RcppTN",
               username = "olmjo",
               ref = "development"
               )
```

## Example Usage

This is taken from the documentation on the main function provided
in `RcppTN`, `rtn()`.

```
library(RcppTN)
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
```

Functions for calculating moments are also available.

The R package also provides a C++--level API for reproducible RNG (and moment
calculation) from a truncated normal distribution.

## More Information

Detailed information on usage (at the R-level and C++-level) and on
performance can be found in the vignettes.

[![Build Status](https://travis-ci.org/olmjo/RcppTN.png?branch=development)](https://travis-ci.org/olmjo/RcppTN)
