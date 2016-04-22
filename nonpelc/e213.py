from euler import memoize, rational
N = 30
def p_t(p1, p2):
    return edgep(p1) if (abs(p1[0] - p2[0]) == 1) != (abs(p1[1] - p2[1]) == 1) else 0

def edgep(p):
    if p[0] == 0 or p[0] == N - 1:
        if p[1] == 0 or p[1] == N - 1:
            return rational(1, 2)
        else:
            return rational(1, 3)
    elif p[1] == 0 or p[1] == N - 1:
        return rational(1,3)
    else:
        return rational(1,4)

def valid(p):
    return 0 <= p[0] < N and 0 <= p[1] < N

def neighbors(p):
    for y1 in (p[1] - 1, p[1] + 1):
        if valid((p[0],y1)):
            yield (p[0],y1)

    for x1 in (p[0] - 1, p[0] + 1):
        if valid((x1, p[1])):
            yield (x1,p[1])

@memoize
def p_E(p, k):
    if p[0] > p[1]:
        return p_E((p[1], p[0]), k)
    if k == 0:
        return 0
    else:
        prob = 1
        for n in neighbors(p):
            prob *= float(rational(1) - p_t(n, p)) ** float(E(n, k - 1))
        return prob

@memoize
def E(p, k):
    if p[0] > p[1]:
        return E((p[1], p[0]), k)
    if k == 0:
        return rational(1,1)
    else:
        e = rational(0)
        for n in neighbors(p):
            e += p_t(n, p) * E(n, k - 1)
        return e

print(sum(p_E((x,y), 1) for x in range(0,N) for y in range(0,N)))
print(sum(float(E((x,y), 50)) for x in range(0,N) for y in range(0,N)))
