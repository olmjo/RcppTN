library(Rcpp)

gctorture(TRUE)

MC <- 2000

sourceCpp("api.cpp")

test(MC)
