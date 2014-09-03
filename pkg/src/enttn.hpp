# ifndef ENTTN_HPP
# define ENTTN_HPP

# include <Rcpp.h>
  
void enttn(const Rcpp::NumericVector &Mean,
           const Rcpp::NumericVector &Sd,
           const Rcpp::NumericVector &Low,
           const Rcpp::NumericVector &High,
           Rcpp::NumericVector &Ents
           ) ;

# endif
