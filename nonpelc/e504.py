from euler import memoize
e = 1e-6
@memoize
def triLP(a,b,c):
    return int(sum(1+int(abs(a*(k/c - 1))-e) + int(abs(b*(1 - k/c))-e) for k in range(1,c)))

def latPoints(a,b,c,d):
    return a + b - 1 + triLP(a,b,c) + triLP(a,b,d)

def isSquare(x):
    return int(x**.5)**2 == x

m = 100
ans = 0
for a in range(1, m+1):
    for b in range(1, a+1):
        for c in range(1, m+1):
            for d in range(1, c+1):
                if isSquare(latPoints(a,b,c,d)):
                    ans += (4//(1+(a==b)))//(1+(c==d))
print(ans)
