from euler import gcd,memoize
@memoize
def R(k):
    return sum(10**x for x in range(0,k))

def A(n):
    if gcd(n,10) != 1:
        return 0

    k = 1
    while R(k) % n > 0:
        k += 1
    return k

n = 1
while A(n) < 1e6:
    n += 1
print(n)
