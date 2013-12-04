gctorture(TRUE)

N <- 20
MC <- 20


cat("\nPre\n")

for(i in 1:MC) {
    rnorm(N)
}

cat("Post\n")


