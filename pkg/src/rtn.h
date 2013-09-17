# ifndef RTN_H
# define RTN_H

# include <Rcpp.h>
  
Rcpp::NumericVector& rtn(const Rcpp::NumericVector &Mean,
                         const Rcpp::NumericVector &Sd,
                         const Rcpp::NumericVector &Low,
                         const Rcpp::NumericVector &High
    ) ;

# endif
