#from euler import memoize

def ways(k, lst):
    if k in lst or k == 1:
        return 0
    else:
        return 1 + min(ways(k - t, lst + [t]) +
                       ways(t, lst + [t]) for t in range(1, (k+3)//2))

print(ways(15, []))
