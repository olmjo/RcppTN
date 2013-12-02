# ifndef ETN_H
# define ETN_H

# include <Rcpp.h>
  
void etn(const Rcpp::NumericVector &Mean,
         const Rcpp::NumericVector &Sd,
         const Rcpp::NumericVector &Low,
         const Rcpp::NumericVector &High,
         Rcpp::NumericVector &Exps
    ) ;

# endif
