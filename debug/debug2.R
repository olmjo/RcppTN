library(RcppTN)

N <- 2000
MC <- 20000


cat("\nPre\n")

for(i in 1:MC) {
    rtn(.mean = rep(0, N))
}



cat("Post\n")


