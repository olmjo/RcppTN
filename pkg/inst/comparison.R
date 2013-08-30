library(RcppTN)
library(rbenchmark)
library(msm)

set.seed(1)

sizes <- c(1e0, 1e2, 1e4, 1e6)
lows <- c(-1, 5, -Inf, 4, 4, -Inf)
highs <- c(1, Inf, 10, 7, 4.1, Inf)


for (case in 1:length(lows)) {
    cat("=======================\n")
    cat("Lower Bound:", lows[case], "\n")
    cat("Upper Bound:", highs[case], "\n\n")

    for (s in sizes) {
        cat("  [ Sample Size per Call:", s,  "]\n")
        out <- benchmark(
            "rtn" = rtn(.mean = rep(0, s),
            .low = rep(lows[1], s),
            .high = rep(highs[1], s)
            ),
            "rtruncnorm" = rtruncnorm(n = s,
            a = rep(lows[1], s),
            b = rep(highs[1], s)
            ),
            replications = 100,
            columns = c("test", "elapsed", "relative")
            )
        print(out)
        cat("\n")
    }
    cat("=======================\n\n")
}
