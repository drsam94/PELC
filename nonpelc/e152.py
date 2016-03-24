from euler import memoize, rational

@memoize
def psum(low, high):
    return sum([rational(1, n**2) for n in range(low, high+1)], rational(0))

@memoize
def ways(x, low, high):
    if x == rational(0):
        print("hi")
        return 1
    elif x < rational(1, high**2) or psum(low, high) < x:
        return 0
    else:
        return ways(x, low + 1, high) + ways(x - rational(1, low**2), low + 1, high)

print(ways(rational(1,2), 2, 35))
