// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 4 -*-

/// R-accessible Vectorized Truncated Normal Density Function

# include <Rcpp.h>
# include "dtn.hpp"

RcppExport SEXP dtnRcpp(const SEXP x,
                        const SEXP mean,
			const SEXP sd,
			const SEXP low,
			const SEXP high
			) {

  // Namespace
  using namespace Rcpp ;
  //
  
  // Conversion of Inputs
  const NumericVector X(x) ;
  const NumericVector Mean(mean) ;
  const NumericVector Sd(sd) ;
  const NumericVector Low(low) ;
  const NumericVector High(high) ;
  //
  
  // Init, Populate, and Return
  NumericVector Dens(X.size(), 0.0) ;
  {
    dtn(X, Mean, Sd, Low, High, Dens) ;
  }
  return(Dens) ;
  //
}
