// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#ifndef __RcppTN_RcppExports_h__
#define __RcppTN_RcppExports_h__

#include <Rcpp.h>

namespace RcppTN {

    using namespace Rcpp;

    namespace {
        void validateSignature(const char* sig) {
            Rcpp::Function require = Rcpp::Environment::base_env()["require"];
            require("RcppTN", Rcpp::Named("quietly") = true);
            typedef int(*Ptr_validate)(const char*);
            static Ptr_validate p_validate = (Ptr_validate)
                R_GetCCallable("RcppTN", "RcppTN_RcppExport_validate");
            if (!p_validate(sig)) {
                throw Rcpp::function_not_exported(
                    "C++ function with signature '" + std::string(sig) + "' not found in RcppTN");
            }
        }
    }

    inline double etn1(const double mean, const double sd, const double low, const double high) {
        typedef SEXP(*Ptr_etn1)(SEXP,SEXP,SEXP,SEXP);
        static Ptr_etn1 p_etn1 = NULL;
        if (p_etn1 == NULL) {
            validateSignature("double(*etn1)(const double,const double,const double,const double)");
            p_etn1 = (Ptr_etn1)R_GetCCallable("RcppTN", "RcppTN_etn1");
        }
        RObject __result;
        {
            RNGScope __rngScope;
            __result = p_etn1(Rcpp::wrap(mean), Rcpp::wrap(sd), Rcpp::wrap(low), Rcpp::wrap(high));
        }
        if (__result.inherits("try-error"))
            throw Rcpp::exception(as<std::string>(__result).c_str());
        return Rcpp::as<double >(__result);
    }

    inline double rtn1(const double mean, const double sd, const double low, const double high) {
        typedef SEXP(*Ptr_rtn1)(SEXP,SEXP,SEXP,SEXP);
        static Ptr_rtn1 p_rtn1 = NULL;
        if (p_rtn1 == NULL) {
            validateSignature("double(*rtn1)(const double,const double,const double,const double)");
            p_rtn1 = (Ptr_rtn1)R_GetCCallable("RcppTN", "RcppTN_rtn1");
        }
        RObject __result;
        {
            RNGScope __rngScope;
            __result = p_rtn1(Rcpp::wrap(mean), Rcpp::wrap(sd), Rcpp::wrap(low), Rcpp::wrap(high));
        }
        if (__result.inherits("try-error"))
            throw Rcpp::exception(as<std::string>(__result).c_str());
        return Rcpp::as<double >(__result);
    }

    inline double vtn1(const double mean, const double sd, const double low, const double high) {
        typedef SEXP(*Ptr_vtn1)(SEXP,SEXP,SEXP,SEXP);
        static Ptr_vtn1 p_vtn1 = NULL;
        if (p_vtn1 == NULL) {
            validateSignature("double(*vtn1)(const double,const double,const double,const double)");
            p_vtn1 = (Ptr_vtn1)R_GetCCallable("RcppTN", "RcppTN_vtn1");
        }
        RObject __result;
        {
            RNGScope __rngScope;
            __result = p_vtn1(Rcpp::wrap(mean), Rcpp::wrap(sd), Rcpp::wrap(low), Rcpp::wrap(high));
        }
        if (__result.inherits("try-error"))
            throw Rcpp::exception(as<std::string>(__result).c_str());
        return Rcpp::as<double >(__result);
    }

}

#endif // __RcppTN_RcppExports_h__
