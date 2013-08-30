# RcppTN

Rcpp-based Truncated Normal RNG by Jonathan Olmsted (jpolmsted@gmail.com)

This R package should be considered a development version. For the time being,
changes to the codebase will occur without version number changes.

## Installation

Using `install_github()` from the `devtools` package will install this for
you. Alternatively, you could clone the repository and build with the Makefile
that is included.

```
library(devtools)
install_github("RcppTN", username = "olmjo", subdir = "pkg")
```

## Example Usage

This is taken from the documentation on the single function provided in `RcppTN`, `rtn()`.

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

