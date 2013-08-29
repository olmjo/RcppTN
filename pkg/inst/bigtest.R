library(RcppTN)

.Ndraws <- 2e6
tpb <- txtProgressBar(min = 0,
                      max = .Ndraws,
                      initial = 0,
                      char = "=",
                      width = NA,
                      style = 3,
                      file = ""
                      )


# Many small draws
i <- 1
while(i < .Ndraws) {
    foo <- rtn()
    i <- i + 1
    setTxtProgressBar(tpb, i)
}
cat("\n")

# Single large draw
foo <- rtn(.mean = rep(0, .Ndraws)
           )

