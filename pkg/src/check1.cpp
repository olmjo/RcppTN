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
  if (low >= high) {
    flag = false ;
  }

  return(flag) ;
} ;
