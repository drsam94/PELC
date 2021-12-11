def cfe(x):
    while True:
        i = int(x)
        f = x - i
        x = 1 / f
        yield i

def convergents(x):
    exp = cfe(x)
    p0 = 1
    q0 = 0
    p = next(exp)
    q = 1
    while True:
        ak = next(exp)
        pn = ak * p + p0
        qn = ak * q + q0
        p0,q0 = (p,q)
        (p,q) = (pn,qn)
        print((pn,qn))
        yield (pn,qn)

def pellSoln(D):
    for (x,y) in convergents(D**.5):
        if x**2 - D*y**2 == 1:
            return x

def ans():
    maxsol = 0
    for D in range(59,60):
        if int(D**.5)**2 != D:
            maxsol = max(pellSoln(D), maxsol)
        print(D)
    return maxsol

print(ans())
