/// Vectorized Truncated Normal RNG

///
/// This code wraps the rtn1() C++ function to call the Truncated
/// Normal RNG multiple times in a vectorized fashion with Rcpp inputs
/// and outputs
///

# include <Rcpp.h>
# include "rtn1.h"

void rtn(const Rcpp::NumericVector &Mean, ///< vector of means
         const Rcpp::NumericVector &Sd, ///< vector of standard deviations
         const Rcpp::NumericVector &Low,	///< vector of lower bounds
         const Rcpp::NumericVector &High,	///< vector of upper bounds
         Rcpp::NumericVector &Draws
         ) {
  
  // Namespace
  using namespace Rcpp ;
  //

  // Calculate Useful Qtys
  const int N = Mean.size() ;
  //

  // Init Storage  
  NumericVector::iterator itD = Draws.begin() ;
  NumericVector::iterator itM = Mean.begin() ;
  NumericVector::iterator itS = Sd.begin() ;
  NumericVector::iterator itL = Low.begin() ;
  NumericVector::iterator itH = High.begin() ;
  //

  // Draw from TN
  while (itD != Draws.end()) {
    *itD = rtn1(*itM, *itS, *itL, *itH);
    itD++ ;
    itM++ ;
    itS++ ;
    itL++ ;
    itH++ ;
  }
  //
}
