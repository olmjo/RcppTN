#include <R_ext/Rdynload.h>

namespace RcppTN {
  typedef double(*Fun)(double, double, double, double) ;

  inline double rtn1(double mean, double sd, double low, double high){
    static Fun rtn1_ = (Fun)R_GetCCallable("RcppTN", "RcppTN_rtn1") ;
    return rtn1_(mean, sd, low, high) ;
  }

  inline double etn1(double mean, double sd, double low, double high){
    static Fun etn1_ = (Fun)R_GetCCallable("RcppTN", "RcppTN_etn1") ;
    return etn1_(mean, sd, low, high) ;
  }
}
