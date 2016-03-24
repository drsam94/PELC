from euler import memoize
# binary prize strings of length n (ignoring lateness)
@memoize
def binPS(n):
    if n < 0:
        return 0
    elif n < 3:
        return 2**n
    else:
        # valid prefixes are:
        # O, AO, AAO
        return binPS(n-1) + binPS(n-2) + binPS(n-3)

# ternary prize strings of length n
def triPS(n):
    # prize strings contain at most one L, so we partition at potential
    # L locations
    return binPS(n) + sum(binPS(k) * binPS(n - k - 1) for k in range(0,n))

print(triPS(30))
