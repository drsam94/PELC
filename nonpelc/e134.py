from euler import primes, numDigits
"""
p1,p2,inc

p2 | inc*k + p1
inc*k + p1 = 0 (mod p2)
inc*k = -p1 (mod p2)
inc*k = p2 - p1 (mod p2)
k = (p2 - p1) * inc^-1  (mod p2)
"""
BOUND=int(1e6)
ps = primes(BOUND + 100)

# Based on Wikipedia source code on Extended Euclidean Algorithm
# computes the multiplicative inverse of a in the field Z/nZ
# The internets also tell me that you can use the Chinese Remainder Theorem
# which I should probably read up on
def modInverse(a, n):
    t = 0
    r = n
    newt = 1
    newr = a
    while newr != 0:
        quot = r // newr
        (t, newt) = (newt, t - quot * newt)
        (r, newr) = (newr, r - quot * newr)
    if t < 0: return t + n
    return t

ans = 0
for i in range(2, len(ps)):
    if ps[i] > BOUND: break;

    p1 = ps[i]
    p2 = ps[i + 1]

    inc = 10 ** numDigits(p1)
    k = ((p2 - p1) * modInverse(inc % p2, p2)) % p2
    n = inc*k + p1
    ans += n
print(ans)
