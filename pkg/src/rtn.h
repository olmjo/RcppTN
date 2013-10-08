# ifndef RTN_H
# define RTN_H

# include <Rcpp.h>
  
void rtn(const Rcpp::NumericVector &Mean,
         const Rcpp::NumericVector &Sd,
         const Rcpp::NumericVector &Low,
         const Rcpp::NumericVector &High,
         Rcpp::NumericVector &Draws
    ) ;

# endif
