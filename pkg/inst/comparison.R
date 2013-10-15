library(RcppTN)
library(msm)
library(microbenchmark)

set.seed(1)

sizes <- c(1e1, 1e3, 1e5)
lows <- c(-1, 5, -Inf, 4, 4, -Inf, 50)
highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)


for (case in 1:length(lows)) {
    cat("=======================\n")
    cat("Lower Bound:", lows[case], "\n")
    cat("Upper Bound:", highs[case], "\n\n")

    for (s in sizes) {
        cat("  [ Sample Size per Call:", s,  "]\n")
        out <- microbenchmark(
            rtn = rtn(.mean = rep(0, s),
            .low = rep(lows[case], s),
            .high = rep(highs[case], s)
            ),
            rtruncnorm = rtruncnorm(n = s,
            a = rep(lows[case], s),
            b = rep(highs[case], s)
            ),
            times = 200L
            )

        print(out)
        cat("\n")
    }
    cat("=======================\n\n")
}


