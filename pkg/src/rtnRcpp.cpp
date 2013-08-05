/// R-accessible Vectorized Truncated Normal RNG

///
/// This code is a wrapper for the rtn() C++ function to be called
/// from R.
///

# include <Rcpp.h>
# include "rtn.h"

RcppExport SEXP rtnRcpp(const SEXP mean, ///< vector of length K
					 ///containing the mean of the
					 ///distribution for each draw
					 ///[real number]

			const SEXP sd, ///< vector of length K
				       ///containing the standard
				       ///deviation for each draw
				       ///[strictly positive real
				       ///number]
			const SEXP low, ///< vector of length K
					///containing the lower bound
					///for each draw; [real number
					///or '-Inf']
			const SEXP high ///< vector of length K
					///containing [real number or
					///'Inf']
			) {

  // Namespace
  using namespace Rcpp ;
  //

  RNGScope scope ;

  // Conversion of Inputs
  const NumericVector Mean(mean) ;
  const NumericVector Sd(sd) ;
  const NumericVector Low(low) ;
  const NumericVector High(high) ;
  //

  // Init, Populate, and Return
  return rtn(Mean, Sd, Low, High) ;
  //
}
