rtn <- function(.mean = rep(0, 1),
                .sd = rep(1, length(.mean)),
                .low = rep(-Inf, length(.mean)),
                .high = rep(Inf, length(.mean))
                ) {
    out <- .Call("rtnRcpp",
                 PACKAGE = "RcppTN",
                 mean = .mean,
                 sd = .sd,
                 low = .low,
                 high = .high
                 )
    return(out)
}
