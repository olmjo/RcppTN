#include <R_ext/Rdynload.h>

namespace RcppTN {
    inline double rtn1(double mean, double sd, double low, double high){
        typedef double(*Fun)(double, double, double, double) ;
        static Fun rtn1_ = (Fun)R_GetCCallable("RcppTN", "RcppTN_rtn1") ;
        return rtn1_(mean, sd, low, high) ;
    }
}
