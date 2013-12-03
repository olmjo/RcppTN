#include <Rcpp.h>
#include <R_ext/Rdynload.h>

#include "rtn1.h"
#include "etn1.h"

RcppExport void R_init_RcppTN (DllInfo *info) {
  R_RegisterCCallable("RcppTN", "RcppTN_rtn1", (DL_FUNC) rtn1) ;
  R_RegisterCCallable("RcppTN", "RcppTN_etn1", (DL_FUNC) etn1) ;
}
