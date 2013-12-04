# include <Rcpp.h>

/// No Truncation
double v0 (const double mean,
	   const double sd,
	   const double low,
	   const double high
	   ) {
  return(pow(sd, 2)) ;
}

/// Truncated Below and Above
double v1 (const double mean,
	   const double sd,
	   const double low,
	   const double high
	   ) {
  double s_low = (low - mean) / sd ;
  double s_high = (high - mean) / sd ;

  double q1 = R::dnorm(s_low, 0.0, 1.0, false) ;
  double q2 = R::dnorm(s_high, 0.0, 1.0, false) ;
  double q3 = R::pnorm(s_low, 0.0, 1.0, true, false) ;
  double q4 = R::pnorm(s_high, 0.0, 1.0, true, false) ;
  
  double t1 = (s_low * q1 - s_high * q2) / (q4 - q3) ;
  double t2 = pow((q1 - q2) / (q4 - q3), 2.0) ;

  double v = pow(sd, 2.0) * (1 +  t1 - t2) ;
  return(v) ;
}

/// Truncated Below
double v2 (const double mean,
	   const double sd,
	   const double low
	   ) {
  double s_low = (low - mean) / sd ;

  double q1 = R::dnorm(s_low, 0.0, 1.0, false) ;
  double q3 = R::pnorm(s_low, 0.0, 1.0, true, false) ;

  double v = pow(sd, 2.0) * (1 + s_low * (q1 / (1 - q3)) - pow(q1 / (1 - q3), 2));
  return(v) ;
}

/// Truncated Above
double v3 (const double mean,
	   const double sd,
	   const double high
	   ) {
  double s_high = (high - mean) / sd ;

  double q2 = R::dnorm(s_high, 0.0, 1.0, false) ;
  double q4 = R::pnorm(s_high, 0.0, 1.0, true, false) ;

  double v = pow(sd, 2.0) * (1 - s_high * (q2 / q4) - pow(q2 / q4, 2.0)) ;

  return(v) ;
}


/// Main Function
double vtn1(const double mean,
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
    out = v0(mean, sd, low, high) ;

  } else if (low == R_NegInf) {

    // Truncated Above
    out = v3(mean, sd, high) ;

  } else if (high == R_PosInf) {

    // Truncation Below
    out = v2(mean, sd, low) ;

  } else {

    // Truncation Above and Below
    out = v1(mean, sd, low, high) ;

  }
  return(out) ;
}