// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 4 -*-

/// Vectorized Truncated Normal Density Function

# include <Rcpp.h>

# ifndef DTN_HPP
# define DTN_HPP

void dtn(const Rcpp::NumericVector &X,
         const Rcpp::NumericVector &Mean,
         const Rcpp::NumericVector &Sd,
         const Rcpp::NumericVector &Low,
         const Rcpp::NumericVector &High,
         Rcpp::NumericVector &Dens
         ) ;

# endif
