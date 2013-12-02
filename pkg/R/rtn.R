rtn <- function(.mean = rep(0, 1),
                .sd = rep(1, length(.mean)),
                .low = rep(-Inf, length(.mean)),
                .high = rep(Inf, length(.mean))
                ) {
    out <- .Call(rtnRcpp,
                 mean = .mean,
                 sd = .sd,
                 low = .low,
                 high = .high
                 )
    if (any(is.na(out))) warning("NAs returned in place of invalid parameters")
    return(out)
}
