#include <Rcpp.h>
#include <RcppTN.h>
// [[Rcpp::depends(RcppTN)]]

// [[Rcpp::export]]
Rcpp::List test(double mc) {
  
  double a = 0.0 ;
  double b = 0.0 ;
  double c = 0.0 ;


  for (int it = 0 ; it < mc ; it++) {
    a = RcppTN::rtn1(0.0, 1.0, 3.5, 3.7) ;
    b = RcppTN::etn1(0.0, 1.0, 3.5, 3.7) ;
    c = RcppTN::vtn1(0.0, 1.0, 3.5, 3.7) ;
  }

  Rcpp::List ret ;
  ret["a"] = a ;
  ret["b"] = b ;
  ret["c"] = c ;

  return(ret) ;
}
