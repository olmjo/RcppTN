etn <- function(.mean = rep(0, 1),
                .sd = rep(1, length(.mean)),
                .low = rep(-Inf, length(.mean)),
                .high = rep(Inf, length(.mean)),
                .checks = TRUE
                ) {
    if (.checks) {
        checkInputs(.mean, .sd, .low, .high)
    }
    out <- .Call("etnRcpp",
                 mean = .mean,
                 sd = .sd,
                 low = .low,
                 high = .high
                 )
    if (.checks) {
        checkOutputs(out)
    }
    return(out)
}
