from euler import memoize

@memoize
def w_r(k):
    return sum(w_b(k - r) for r in range(3,k+1))

@memoize
def w_b(k):
    return sum(w_r(k - b) for b in range(1, k+1))

def w(k):
    return w_r(k) + w_b(k)

print(w(50))
