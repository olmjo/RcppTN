# include <Rcpp.h>

bool check1(const double mean,
	    const double sd,
	    const double low,
	    const double high
	    ) {
  bool flag = true ;
  if (sd <= 0) {
    flag = false ;
  }
  if (mean == R_NegInf) {
    flag = false ;    
  }
  if (mean == R_PosInf) {
    flag = false ;
  }
  if (low >= high) {
    flag = false ;
  }

  return(flag) ;
} ;
