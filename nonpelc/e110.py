from euler import product, primes
ps = primes(200)
N = 4000000

def primorial(end, start=0):
    return product(ps[start:end])

def ways(k, v):
    v = v[:]
    w = 3**(k - len(v))
    if len(v) > 1:
        if v[0] > 2 and v[1] > 1:
            v[0] -=1
            v[1] -=1
            w *= 3

    for j in v:
        w *= ps[j + 1]
    return (w - 1) // 2

def getnum(k, v):
    n = primorial(k)
    for i, val in enumerate(v):
        n *= ps[i]**val
    return n

def min_at_k(k, v, glbl_min):
    if getnum(k, v) > glbl_min:
        return glbl_min,k,v
    if ways(k, v) > N:
        m,ks,vs = getnum(k, v), k, v
    else:
        m = float("inf")
    if len(v) < k:
        L,kc,vc = min_at_k(k, v + [1], glbl_min)
        if L < m:
            m,ks,vs = L,kc,vc
    else:
        m,ks,vs = glbl_min,0,[]
    if v:
        for j in range(0, len(v)):
            vc = v[:]
            vc[j] += 1
            L,kc,vc = min_at_k(k, vc, glbl_min)
            if L < m:
                m,ks,vs = L,kc,vc
    return m,ks,vs

def base_ways(k):
    d = 1
    for i in range(2,k):
        if (k * k) % i == 0:
            d += 1
    return d

def test():
    for k in range(3, 6):
        for v in [ [] , [1,1], [2,2], [1,1,1]]:
            N = getnum(k,v)
            print(N, ways(k, v), base_ways(N))

test()
k = 2
while ways(k, []) < N:
    k += 1
k += 2
min_ans = getnum(k, [])

for v in [ [], [1,1], [2,1], [3,1], [3,2] ]:
    print(ways(5,v), base_ways(getnum(5, v)))

for j in range(k-1, 4, -1):
    m,ks,v = min_at_k(j, [], min_ans)
    if m < min_ans:
        min_ans = m
        print(min_ans, j, ks, v, ways(ks, v))
print(min_ans)
