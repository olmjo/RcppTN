# include <Rcpp.h>


/// No Truncation
double e0 (const double mean,
	   const double sd,
	   const double low,
	   const double high
	   ) {
  return(mean) ;
}

/// Truncated Below and Above
double e1 (const double mean,
	   const double sd,
	   const double low,
	   const double high
	   ) {

  using namespace Rcpp ;

  double s_low = (low - mean) / sd ;
  double s_high = (high - mean) / sd ;

  double q1 = R::dnorm(s_low, 0.0, 1.0, false) ;
  double q2 = R::dnorm(s_high, 0.0, 1.0, false) ;
  double q3 = R::pnorm(s_low, 0.0, 1.0, true, false) ;
  double q4 = R::pnorm(s_high, 0.0, 1.0, true, false) ;

  return(mean + sd * ((q1 - q2) / (q4 - q3))) ;
}

/// Truncated Below
double e2 (const double mean,
	   const double sd,
	   const double low
	   ) {
  using namespace Rcpp ;

  double s_low = (low - mean) / sd ;

  double q1 = R::dnorm(s_low, 0.0, 1.0, false) ;
  double q3 = R::pnorm(s_low, 0.0, 1.0, true, false) ;

  return(mean + sd * ((q1) / (1 - q3))) ;
}

/// Truncated Above
double e3 (const double mean,
	   const double sd,
	   const double high
	   ) {
  using namespace Rcpp ;

  double s_high = (high - mean) / sd ;

  double q2 = R::dnorm(s_high, 0.0, 1.0, false) ;
  double q4 = R::pnorm(s_high, 0.0, 1.0, true, false) ;

  return(mean - sd * ((q2) / (q4))) ;
}


/// Main Function
double etn1(const double mean,
	    const double sd,
	    const double low,
	    const double high
	    ) {
  // Namespace
  using namespace Rcpp ;
  //

  // Init Useful Values
  double out = NA_REAL ;
  //

  if (low == R_NegInf &&
      high == R_PosInf) {

    // No Truncation
    out = e0(mean, sd, low, high) ;

  } else if (low == R_NegInf) {

    // Truncated Above
    out = e3(mean, sd, high) ;

  } else if (high == R_PosInf) {

    // Truncation Below
    out = e3(mean, sd, low) ;

  } else {

    // Truncation Above and Below
    out = e1(mean, sd, low, high) ;

  }
  return(out) ;
}
