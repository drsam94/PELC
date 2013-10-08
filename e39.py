import math

sols = {}
for a in range(2,500):
    for b in range(a, 500):
        c2 = a ** 2 + b ** 2
        c  = int(math.sqrt(c2))
        if c2 == c * c:
            p = a + b + c
            if p <= 1000:
                if p in sols.keys():
                    sols[p] += 1
                else:
                    sols[p]  = 1

ans = 0
maxsols = 0
for p in sols.keys():
    if maxsols < sols[p]:
        ans = p
        maxsols = sols[p]
print ans
