/// R-accessible Vectorized Expectation Calculationg for Truncated Normals

///
/// This code is a wrapper for the etn() C++ function to be called
/// from R.
///

# include <Rcpp.h>
# include "etn.h"

RcppExport SEXP etnRcpp(const SEXP mean, ///< vector of length K
					 ///containing the mean of the
					 ///distribution for each
					 ///calculation [real number]

			const SEXP sd, ///< vector of length K
				       ///containing the standard
				       ///deviation for each
				       ///calculation [strictly
				       ///positive real number]
			const SEXP low, ///< vector of length K
					///containing the lower bound
					///for each calculation [real
					///number or '-Inf']
			const SEXP high ///< vector of length K
					///containing the upper bound
					///for each calculation [real
					///number or 'Inf']
			) {

  // Namespace
  using namespace Rcpp ;
  //

  // Conversion of Inputs
  const NumericVector Mean(mean) ;
  const NumericVector Sd(sd) ;
  const NumericVector Low(low) ;
  const NumericVector High(high) ;
  //

  // Init, Populate, and Return
  NumericVector Exps(Mean.size(), 0.0) ;
  etn(Mean, Sd, Low, High, Exps) ;
  return(Exps);
  //
}