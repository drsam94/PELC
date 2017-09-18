def idem(mat):
    R = range(0, 3)
    return all(mat[i][j] == sum(mat[i][r] * mat[r][j] for r in R) for i in R for j in R) # pylint: disable=all

def divCheck(a, b, c):
    if a == 0:
        if b*c != 0:
            return True
    elif (b * c) % a != 0:
        return True
    return False

def triples(N, atLeast=None):
    K = 2*N+1
    base = 0 if not atLeast else sum((a+N)*b for a,b in zip(atLeast, [K**2, K, 1]))
    for k in range(base, K**3 + 1):
        yield (k//K**2 - N, (k%K**2)//K - N, k%K - N)

def diags(N):
    for i in range(-N, N + 1):
        for j in range(-N, N + 1):
            for s in (1, 2):
                k = s - i - j
                if -N <= k <= N:
                    ans = (i, j, k)
                    if -N not in ans and ans > (1 - i, 1 - j, 1 - k):
                        continue
                    yield(i, j, k)
def lindep(a, b, c, d, e, f):
    if a == b == c == 0 or d == e == f == 0:
        return True
    rat = None
    for x,y in ((a,d), (b, e), (c, f)):
        if x == 0 or y == 0:
            rat = 0
        else:
            rat = 1. * y / x
            break
    return rat and (a*rat == d and b*rat == e and c*rat == f)

if __name__ == "__main__":
    cnt = 0
    tot = 0
    N = 2
    R = range(-N, N + 1)
    # preprocessed to save us a bit
    BCF = [(b,c,f) for (b,c,f) in triples(N) if not divCheck(c,b,f)]
    for (a,e,i) in diags(N):
        trace = a + e + i
        for (b, c, f) in BCF:
            if c != c * (a + i) + b * f:
                continue
            for d in range(-N, N + 1):
                if f != f * (e + i) + c * d:
                    continue
                dependant = lindep(a,b,c,d,e,f)
                if not dependant and trace == 1:
                    continue
                for g in range(-N, N + 1):
                    if (d, g, -N) > (b, c, f):
                        continue
                    if a != a*a + b*d + c*g:
                        continue
                    #if trace == 1 and lindep(a,d,g,c,f,i):
                    #    continue
                    hpos = []
                    if dependant:
                        hpos = range(-N, N + 1)
                    else:
                        #hpos = range(-N, N + 1)
                        #Xa + Yd = g
                        #Xc + Yf = i
                        det = a*f - d*c
                        if det == 0:
                            hpos = range(-N, N + 1)
                        else:
                            X = 1. * (f * g - d * i) / det
                            Y = 1. * (-c * g + a * i) / det
                            hp = int(X * b + Y * e)
                            if -N <= hp <= N:
                                hpos = [hp]
                    for h in hpos:
                        if (d, g, h) > (b, c, f):
                            continue
                        if divCheck(h, g, b):
                            continue
                        if divCheck(g, h, d):
                            continue
                        if divCheck(b, c, h):
                            continue
                        if idem([ [a, b, c], [d, e, f], [g, h, i] ]):
                            mul = 1
                            if (b, c, f) != (d, g, h):
                                mul *= 2
                            if -N not in (a, e, i):
                                mul *= 2
                            cnt += mul
                        tot += 1
    # Add 2 for the matrices 0 and I
    print(cnt + 2)
    #print(diagc, badc)
    print("%g = %d/%d" % (float(tot)/len(R)**9, tot, len(R)**9))
