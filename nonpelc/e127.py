from euler import primes, gcd, radical

N = 120000
ps = primes(N)

rad = [0] + [radical(n, ps) for n in range(1, N+1)]
ans = 0
relradsorted = sorted(list(range(1, N)),key=lambda x: rad[x]/x)
radsorted    = sorted(list(range(1, N)),key=lambda x: rad[x])
m = 1000
for c in relradsorted:
    if rad[c]/c > 1/2:
        break
    for a in radsorted:
        if a > c//2-1:
            continue
        if rad[a] > (c/rad[c]):
            break
        b = c - a
        if gcd(a,b) == gcd(a,c) == gcd(b,c) == 1:
            if rad[a]*rad[b]*rad[c] < c:
                ans += c
print(ans)
