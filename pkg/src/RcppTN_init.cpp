#include <Rcpp.h>
#include <R_ext/Rdynload.h>

#include "rtn1.h"

RcppExport void R_init_RcppTN (DllInfo *info) {
  R_RegisterCCallable("RcppTN", "RcppTN_rtn1", (DL_FUNC) rtn1) ;
}
