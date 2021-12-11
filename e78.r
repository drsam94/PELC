N = 100000
p <- array(0, dim=c(N))

p[1] <- 1
p[2] <- 1
for (n in 2:N) {
    n1 <- 1
    n2 <- 1
    k  <- 1
    while (n1 > 0 || n2 > 0) {
        n1 <- n - (k*(3*k-1)) %/% 2
        n2 <- n - (k*(3*k+1)) %/% 2
        c  <- 0
        if (n1 >= 0) {
            c <- p[n1+1]
        }
        if (n2 >= 0) {
            c <- c + p[n2+1]
        }
        if (k %% 2 == 0) {
            c <- c * -1
        }
        p[n+1] <- (p[n+1] + c) %% 1000000
        k <- k + 1
    }
    if (p[n+1] == 0) {
        print(n)
        break
    }
}
