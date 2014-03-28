// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 4 -*-

/// Vectorized Truncated Normal Density Function

# include <Rcpp.h>
# include "dtn1.hpp"
# include "check1.h"

void dtn(const Rcpp::NumericVector &X,
         const Rcpp::NumericVector &Mean,
         const Rcpp::NumericVector &Sd,
         const Rcpp::NumericVector &Low,
         const Rcpp::NumericVector &High,
         Rcpp::NumericVector &Dens
         ) {
  
    // Namespace
    using namespace Rcpp ;
    //

    // Init Storage
    NumericVector::iterator itX = X.begin() ;
    NumericVector::iterator itM = Mean.begin() ;
    NumericVector::iterator itS = Sd.begin() ;
    NumericVector::iterator itL = Low.begin() ;
    NumericVector::iterator itH = High.begin() ;
    NumericVector::iterator itD = Dens.begin() ;
    //

    // Calculate Densities
    while (itD != Dens.end()) {
        if (check1(*itM, *itS, *itL, *itH)) {
            *itD = dtn1(*itX, *itM, *itS, *itL, *itH) ;
        } else {
            *itD = NA_REAL ;
        }
        itX++ ;
        itD++ ;
        itM++ ;
        itS++ ;
        itL++ ;
        itH++ ;
    }
    //
}
