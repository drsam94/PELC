N = 100000
def isprime(x):
    return all(x%i for i in range(2,int(x**.5+1)))

def _primes(n):
    return [x for x in range(2,n) if isprime(x)]

primes = _primes(N+1)

def radical(n):
    r = 1
    for p in primes:
        if n % p == 0:
            while n % p == 0:
                n //= p
            r *= p
        if p > n:
            return r
    return r

rads = [(n,radical(n)) for n in range(1,N+1)]

print(sorted(rads,key=lambda x:x[1])[9999][0])
