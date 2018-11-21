import itertools
import sys
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
def eqEps(a, b):
    return abs(a - b) < 1e-8;

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
    return rat and (eqEps(a*rat,d) and eqEps(b*rat,e) and eqEps(c*rat,f))

def solutions(a, b, c):
    det = a[0] * a[3] - a[1] * a[2]
    if det == 0:
        return []
    X = 1. * (a[3] * b[0] - a[1] * b[1]) / det
    Y = 1. * (-a[2] * b[0] + a[0] * b[1]) / det
    hp = int(X * c[0] + Y * c[1])
    if -N <= hp <= N:
        return [hp]

def possibilities(A, B, N):
    if A == B == 0:
        return range(-N, N + 1)
    elif A == 0:
        return []
    elif B % A != 0:
        return []
    else:
        c = B / A
        return [c] if -N <= c <= N else []
if __name__ == "__main__":
    cnt = 0
    tot = 0
    N = int(sys.argv[1])
    R = range(-N, N + 1)
    # preprocessed to save us a bit
    for (a,e,i) in diags(N):
        trace = a + e + i
        #print((a,e,i))
        for (b, f) in itertools.product(R, repeat=2):
            crange = possibilities(1 - a - i, b * f, N)
            for c in crange:
                drange = possibilities(c, f * (1 - e - i), N)
                for d in drange:
                    if (d, -N, -N) > (b, c, f):
                        continue
                    dependant = lindep(a,b,c,d,e,f)
                    if not dependant and trace == 1:
                        continue
                    #a == a*a + b*d + c*g
                    grange = possibilities(c, a - a**2 - b*d, N)
                    for g in grange:
                        if (d, g, -N) > (b, c, f):
                            continue
                        dependant2 = lindep(a,d,g,c,f,i)
                        if trace == 1 and not dependant2:
                            continue
                        hpos = []
                        if not dependant:
                            hpos = solutions([a,d,c,f], [g, i], [b, e])
                        if not hpos and not dependant2:
                            hpos = solutions([a,d,c,f], [b, e], [g, i])
                        if not hpos:
                            hpos = range(-N, N + 1)
                        for h in hpos:
                            if (d, g, h) > (b, c, f):
                                continue
                            #if divCheck(h, g, b):
                            #    continue
                            #if divCheck(g, h, d):
                            #    continue
                            #if divCheck(b, c, h):
                            #    continue
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
