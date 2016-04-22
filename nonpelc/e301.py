from euler import memoize
def X(a,b,c):
    return a ^ b ^ c

@memoize
def count(n):
    if n < 2:
        return 1
    else:
        return sum(count(n - k) for k in range(2, n+1))

def check(n):
    a = 0
    for k in range(2**(n - 1), 2**n):
        a += (X(k,2*k,3*k) == 0)
    return a

print(1 + sum(count(n) for n in range(1,31)))
