dtn <- function(.x = 0,
                .mean = rep(0, length(.x)),
                .sd = rep(1, length(.x)),
                .low = rep(-Inf, length(.x)),
                .high = rep(Inf, length(.x)),
                .checks = TRUE
                ) {
    if (.checks) {
        checkInputs(.mean, .sd, .low, .high)
    }
    out <- .Call("dtnRcpp",
                 x = .x,
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
