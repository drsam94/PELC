from euler import product
import cmath

def p(x, q):
    return 1 - x/q


# Wikipedia, computing Poisson Distribution using DFT
def Pr(q, n, k):
    C = cmath.exp(complex(0,2*cmath.pi/(n + 1)))
    return 1/(n+1) * sum(C**(-l * k) *
                         product(1 + (C**l - 1)*p(m,q) for m in range(1,n+1))
                                                       for l in range(0, n+1))

# Searching over decimal places
def findQ(q0,k=0):
    if k == 11:
        return q0
    s = 10**(-k)
    while Pr(q0 + s, 50,20).real > 0.02:
        q0 += s

    return findQ(q0, k + 1)

# Rounding and Truncating
print(round(findQ(51)*10**10)/10**10)
