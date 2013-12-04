context("API")

test_that("API agrees with RcppTN R functions", {
    sourceCpp(code = "
 #include <Rcpp.h>

#include <RcppTN.h>
// [[Rcpp::depends(RcppTN)]]

using namespace Rcpp ;

// [[Rcpp::export]]
List rcpp_hello_world() {
  double a = RcppTN::rtn1(0.0, 1.0, 3.5, 3.7) ;
  double b = RcppTN::etn1(0.0, 1.0, 3.5, 3.7) ;
  NumericVector y = NumericVector::create( a, b ) ;
  List z = List::create( y ) ;
  return(z) ;
}
"
              )

    set.seed(1)
    check1 <- rcpp_hello_world()[[1]]
    set.seed(1)
    check2 <- c(rtn(0, 1, 3.5, 3.7),
                etn(0, 1, 3.5, 3.7)
                )
    expect_true(all(check1 == check2))
}
          )

