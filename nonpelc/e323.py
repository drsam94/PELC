from euler import choose, rational, memoize

@memoize
def EN(k):
    if k == 0:
        return rational(0)
    return rational(1,(2**k-1)) * sum(
      [choose(k, i,1) * (EN(k - i) + 1) for i in range(1,k + 1)], rational(1))

print(float(EN(32)))
