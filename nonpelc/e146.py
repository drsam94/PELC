from euler import primes

N = int(150 * 1e6)
ps = primes(10000)

badrems = {}

for p in ps:
    badrems[p] = []
    print(p)
    for r in range(0, p):
        for k in [1,3,7,9,13,27]:
            if ((r%p)**2 + k) % p == 0:
                badrems[p].append(r)
                break

ans = 10
for k in range(2,N//10):
    n = k * 10
    if any(n % p in badrems[p] for p in ps):
        continue
    candidate = True
    for p in range(10001, n + 1, 2):
        for k in [1,3,7,9,13,27]:
            if ((n%p)**2 + k) % p == 0:
                candidate = False
                break
        if not candidate:
            break
    if candidate:
        ans += n
print(ans)
