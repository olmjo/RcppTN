context("Expectation Calculation")

test_that("Expectations are symmetic", {
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        out1 <- etn(.mean = 0,
                    .low = lows[case],
                    .high = highs[case]
                    )
        out2 <- etn(.mean = 0,
                    .high = -lows[case],
                    .low = -highs[case]
                    )
        expect_true((out1 + out2) < .01)
    }
}
          )

test_that("NAs returned on invalid input", {
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        suppressWarnings({
            expect_true(all(is.na(etn(.mean = c(Inf, -Inf),
                                      .sd = rep(1, 2),
                                      .low = rep(lows[case], 2),
                                      .high = rep(highs[case], 2)
                                      )
                                  )
                            )
                        )
            expect_true(all(is.na(etn(.mean = rep(0, 4),
                                      .sd = c(0, -1, -Inf, Inf),
                                      .low = rep(lows[case], 4),
                                      .high = rep(highs[case], 4)
                                      )
                                  )
                            )
                        )
            expect_true(all(is.na(etn(.mean = rep(0, 4),
                                      .sd = rep(1, 4),
                                      .low = rep(highs[case], 4),
                                      .high = rep(lows[case], 4)
                                      )
                                  )
                            )
                        )
        }
                         )
    }
}
          )
