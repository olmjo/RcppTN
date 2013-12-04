# ifndef VTN_H
# define VTN_H

# include <Rcpp.h>
  
void vtn(const Rcpp::NumericVector &Mean,
         const Rcpp::NumericVector &Sd,
         const Rcpp::NumericVector &Low,
         const Rcpp::NumericVector &High,
         Rcpp::NumericVector &Vars
    ) ;

# endif
