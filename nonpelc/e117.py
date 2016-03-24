from euler import memoize

@memoize
def w(m,n):
    if n < 1:
        return 1 if n == 0 else 0
    else:
        return w(2, n - 1) + sum(w(m, n - m) for m in range(2, 5))

print(w(2, 50))
