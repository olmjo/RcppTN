/// Vectorized Truncated Normal RNG

///
/// This code wraps the rtn1() C++ function to call the Truncated
/// Normal RNG multiple times in a vectorized fashion with Rcpp inputs
/// and outputs
///

# include <Rcpp.h>
# include "rtn1.h"

Rcpp::NumericVector& rtn(const Rcpp::NumericVector &Mean, ///< vector of means
                         const Rcpp::NumericVector &Sd, ///< vector of standard deviations
                         const Rcpp::NumericVector &Low,	///< vector of lower bounds
                         const Rcpp::NumericVector &High	///< vector of upper bounds
                         ) {

  // Namespace
  using namespace Rcpp ;
  //

  // Calculate Useful Qtys
  const int N = Mean.size() ;
  //

  // Init Storage
  NumericVector Draws(N) ;
  //

  // Draw from TN
  for (int i = 0; i < N; i++) {
    Draws(i) = rtn1(Mean(i), Sd(i), Low(i), High(i));
  }
  //

  // Return
  return Draws ;
  //
}
