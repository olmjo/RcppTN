library(RcppTN)

gctorture(TRUE)

N <- 20
MC <- 20

for(i in 1:MC) {
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(-1, N),
        .high = rep(1, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(5, N),
        .high = rep(Inf, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(-Inf, N),
        .high = rep(10, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(4, N),
        .high = rep(7, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(4, N),
        .high = rep(4.1, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(-Inf, N),
        .high = rep(Inf, N)
        )
    rtn(.mean = rep(0, N),
        .sd = rep(1, N),
        .low = rep(50, N),
        .high = rep(100, N)
        )
}
