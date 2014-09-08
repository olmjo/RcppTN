library(RcppTN)

gctorture(TRUE)

N <- 20
MC <- 20

funcs <- c("rtn", "etn", "vtn", "enttn")

for (i in 1:MC) {
    dtn(.x = 2,
        .mean = 0,
        .sd = 1,
        .low = -Inf,
        .high = Inf
        )
    for (f in funcs) {
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(-1, N),
               .high = rep(1, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(5, N),
               .high = rep(Inf, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(-Inf, N),
               .high = rep(10, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(4, N),
               .high = rep(7, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(4, N),
               .high = rep(4.1, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(-Inf, N),
               .high = rep(Inf, N)
               )
        get(f)(.mean = rep(0, N),
               .sd = rep(1, N),
               .low = rep(5, N),
               .high = rep(100, N)
               )
    }
}
