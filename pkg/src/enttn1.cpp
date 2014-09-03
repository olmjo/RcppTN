// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 4 -*-

const double PI = 3.141592653589793238463 ;

# include <Rcpp.h>

double enttn1(const double mean,
              const double sd,
              const double low,
              const double high
              ) {
    double alpha = (low - mean) / sd ;
    double beta = (high - mean) / sd ;
    
    // Rcpp::Rcout << alpha << std::endl ;
    // Rcpp::Rcout << beta << std::endl ;

    double q1 = R::pnorm(beta, 0.0, 1.0, true, false) ;
    double q2 = R::pnorm(alpha, 0.0, 1.0, true, false) ;
    double q3 = q1 - q2 ;

    double q4 = R::dnorm(alpha, 0.0, 1.0, false) ;
    double q5 = R::dnorm(beta, 0.0, 1.0, false) ;


    // currently requires finite alpha and finite beta
    double num = alpha * q4 - beta * q5 ;
    double denom = 2 * q3 ;

    double res = (.5 * log(2 * PI * exp(1)) +
                  log(sd * q3) +
                  num / denom
                  );

    return(res) ;
}
