from euler import memoize

@memoize
def w_c(m,n):
    if n < 1:
        return 1 if n == 0 else 0
    else:
        return w_c(m, n - 1) + w_c(m, n - m)

def w(m,n):
    return w_c(m,n) - 1

print(sum(w(m, 50) for m in range(2,5)))
