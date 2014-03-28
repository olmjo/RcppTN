context("Density Calculation")

N <- 100
vX <- runif(N, -5, 5)
vX2 <- abs(vX)

test_that("Densities are consistent with no truncation", {
    d1 <- dtn(vX)
    d2 <- dnorm(vX)
    expect_true(all(d1 == d2))
}
          )

test_that("1/2 Normal densities are 2 times Normal Densities", {
    d1 <- dtn(.x = vX2, .low = rep(0, N))
    d2 <- dnorm(vX2)
    expect_true(all(d1 == 2 * d2))
}
          )

