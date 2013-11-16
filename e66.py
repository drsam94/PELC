import math

def gcd(a, b):
    return a if b == 0 else gcd(b, a%b)

class rational:
    def __add__(self, other):
        return rational(self.num*other.denom+other.num*self.denom,self.denom*other.denom)

    def inverse(self):
        return rational(self.denom, self.num)

    def __init__(self, n, d):
        g = gcd(n, d)
        self.num   = n / g
        self.denom = d / g

coefDict = {}

def coeff(n,D):
    if n == 1:
        return int(math.sqrt(D))
    else:
        lst = coefDict[D]
        return lst[(n - 2)%len(lst)]

def nextDepth(n,N,D):
    if n == N:
        return rational(coeff(n,D),1)
    else:
        return rational(coeff(n,D),1) + nextDepth(n+1,N,D).inverse()

def nthConv(n,D):
    return nextDepth(1,n,D)

def mag(x):
    return 100 if x < 10 else 10 * mag(x / 10)

def nextTerm(N, m, b):
    d  = (N - b ** 2) / m
    k  = int(math.ceil(2.0 * b / d))
    bp = k*d - b
    if bp ** 2 > N:
        k -= 1
        bp = k*d - b
    return k,d,bp

def computeExpansion(D):
    b = int(math.sqrt(D))
    coefDict[D] = []
    m = 1
    computations = []
    while True:
        a, m, b = nextTerm(D, m, b)
        c = mag(b)*m + b
        if c not in computations:
            coefDict[D].append(a)
            computations.append(c)
        else:
            break

def minx(D):
    computeExpansion(D)
    n = 1
    while True:
        test = nthConv(n,D)
        if test.num ** 2 - D * (test.denom ** 2) == 1:
            return test.num
        n += 1

ans = 0
maxsol = 0
for D in range(2,1000):
    if int(math.sqrt(D)) ** 2 != D:
        x = minx(D)
        if x > maxsol:
            ans = D
            maxsol = x
print ans

