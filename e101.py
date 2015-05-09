import numpy
import math
u = [1,-1,1,-1,1,-1,1,-1,1,-1, 1]

def evalPoly(f, n):
    s = 0
    for i in range(0, len(f)):
        s += f[i] * (n ** (i))
    return s

def getPoly(seq):
    a = numpy.matrix([ [n ** j for j in range(0, len(seq))] for n in range(1, len(seq) + 1)])
    b = numpy.array(seq)
    return [round(k) for k in numpy.linalg.solve(a, b)]

def FIT(p):
    for i in range(1, 12):
        nextVal = evalPoly(p, i)
        if nextVal != evalPoly(u, i):
            return nextVal
    return 0

ans = 0
seq = []
for i in range(1, 11):
    seq.append(evalPoly(u, i))
    p = getPoly(seq)
    print(p)
    fit = FIT(p)
    ans += fit
print(ans)

"""
a + b +  c   = u1
a + 2b + 3c  = u2
a + 4b + 9c  = u3

a + 9b + 27c = k


a + b*(i^2) + c*(i^3) + d*(i^4)
"""
