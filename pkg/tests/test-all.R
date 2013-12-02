library("RcppTN")
library("testthat")

set.seed(1)
test_dir("./testthat/")

set.seed(2)
test_file("./testthat/test-RNG.R")
