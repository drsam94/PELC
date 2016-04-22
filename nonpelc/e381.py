from euler import primes, fac

def S(p):
    if p == 5: return 4
    return (mfac(p - 6, p) * -45) % p

def lazyS(p):
    return sum(fac(p - k) for k in range(1, 6)) % p

def mfac(k, p):
    r = 1
    for f in range(1, k + 1):
        r = (r * f) % p
    return r

ps = primes(int(1e2))
a = 0
for p in ps:
    if p >= 5:
        k = S(p)
        print(mfac(p - 6, p), (-fac(p - 1) / fac(5)) % p, p)
        a += k

print(a)
