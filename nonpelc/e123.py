
primes = [x for x in range(2,1000000) if all(x%i for i in range(2,int(x**.5+1)))]

for n,p in enumerate(primes):
    n += 1
    r = ((p - 1)**n + (p + 1)**n) % (p**2)
    if r > 1e10:
        print(n)
        break


