from euler import memoize

@memoize
def w_r(m,n):
    return sum(w_b(m,n - r) for r in range(m,n+1)) if n > 0 else 1

@memoize
def w_b(m,n):
    return sum(w_r(m,n - b) for b in range(1, n+1)) if n > 0 else 1

def F(m,n):
    return w_r(m,n) + w_b(m,n)

n = 1
m = 50
while F(m,n) < 1e6:
    n+=1
print(n)
