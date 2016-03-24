from euler import primes
from math import log

# Generalized Hamming Count
def ghc(n, ps):
    if not ps:
        return 1
    else:
        p = ps[-1]
        k = int(log(n, p))
        # Important to not do an integer division here!
        return sum(ghc(n/(p**i), ps[:-1]) for i in range(0,k+1))

print(ghc(1e9, primes(100)))
