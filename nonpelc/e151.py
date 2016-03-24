from euler import memoize
from decimal import Decimal

def transition(a, i):
    tf = [  [-1, 1, 1, 1],
            [0 ,-1, 1, 1],
            [0 , 0,-1, 1],
            [0 , 0, 0,-1] ]
    return tuple([x + y for x,y in zip(a, tf[i])])

@memoize
def E(a):
    if a[:3] == (0,0,0):
        return 0
    A = sum(a)
    return (A == 1) + sum( Decimal(a[i] / A) * E(transition(a, i)) for i in range(0, 4) if a[i] > 0)

print(E((1,1,1,1)))
