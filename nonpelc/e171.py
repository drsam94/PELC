from euler import memoize, fac, product
from itertools import combinations

squares = [x for x in range(1, 9**2*20+1) if round(x**.5)**2 == x]

@memoize
def waysAsSquares(x, k, m):
    if x < 0 or k < 0:
        return []
    if x == 0:
        return [[]]
    else:
        ways = []
        for n in range(m, min(int(x**.5)+1, 10)):
            subways = waysAsSquares(x - n**2, k - 1, n)
            if subways:
                subways = [ [n] + l for l in subways ]
            ways += subways
        return ways

def numPermutsViable(xs, permut):
    ys = xs[:]
    for x in permut:
        if x != 0:
            ys.remove(x)
    if not ys:
        return 1
    permuts = 0
    for leadingZeroes in range(0, 12 - len(ys)):
        for y in set(ys):
            zs = ys[:]
            zs.remove(y)
            equivs = [zs.count(z) for z in zs] + [11 - leadingZeroes - len(ys)]
            permuts += fac(10 - leadingZeroes) // product([fac(e) for e in equivs])

    return permuts

def numNonZero(lst):
    return len(lst) - lst.count(0)

def numify(lst):
    return int(str(lst)[1:-1].replace(', ', ''))

def sumAllPerms(digits):
    return sum(numify(permut) for permut in perm_unique(digits)) % int(1e9)

class unique_element:
    def __init__(self,value,occurrences):
        self.value = value
        self.occurrences = occurrences

def perm_unique(elements, r=None):
    eset=set(elements)
    listunique = [unique_element(i,elements.count(i)) for i in eset]
    u= r or len(elements)
    return perm_unique_helper(listunique,[0]*u,u-1)

def perm_unique_helper(listunique,result_list,d):
    if d < 0:
        yield tuple(result_list)
    else:
        for i in listunique:
            if i.occurrences > 0:
                result_list[d]=i.value
                i.occurrences-=1
                for g in perm_unique_helper(listunique,result_list,d-1):
                    yield g
                i.occurrences+=1

def modSumPermut(xs):
    s = 0
    zpadded = xs + [0]*8
    for permut in set(combinations(zpadded, 9)):
        s += (sumAllPerms(permut) * numPermutsViable(xs, permut)) % int(1e9)
    return s

def contribution(sq):
    print(sq)
    c = sum(modSumPermut(w) for w in waysAsSquares(sq, 20, 1)) % int(1e9)
    print(c)
    return c

print(sum(contribution(sq) for sq in squares) % int(1e9))
