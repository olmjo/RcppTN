N <- 2000
MC <- 20000


cat("\nPre\n")

for(i in 1:MC) {
    rnorm(N)
}

cat("Post\n")


