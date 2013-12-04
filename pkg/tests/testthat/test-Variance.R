context("Variance Calculation")

test_that("Variances  are identical for symmetric cases", {
lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)

for(case in 1:length(lows)) {
    out1 <- vtn(.mean = 0,
                .low = lows[case],
                .high = highs[case]
                )
    out2 <- vtn(.mean = 0,
                .high = -lows[case],
                .low = -highs[case]
                )
    expect_true(abs(out1 - out2) < .01)
}
}
          )
