hex <- function(n) n*(2*n-1)

isPent <- function(p) {
    root <- as.double(sqrt(24*p + 1))
    (root * root == 24*p + 1) && ((root + 1) %% 6 == 0)
}

for (i in 144:30000) {
    h <- hex(i)
    if (isPent(h)) {
        print(h)
        break
    }
}
