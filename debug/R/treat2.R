library(Rcpp)

gctorture(FALSE)

MC <- 2000

sourceCpp("api.cpp")

test(MC)
