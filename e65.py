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

def digisum(x):
    if x < 10:
        return x
    else:
        return x % 10 + digisum(x / 10)

def coeff(n):
    if n == 1:
        return 2
    elif n % 3 == 0:
        return 2 * (n / 3)
    else:
        return 1

def nextDepth(n,N):
    if n == N:
        return rational(1,coeff(n))
    else:
        return rational(coeff(n),1) + nextDepth(n+1,N).inverse()

def nthConv(n):
    return nextDepth(1,n)

print digisum(nthConv(100).num)
