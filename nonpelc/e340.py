from euler import memoize

a = 21**7
b = 7**21
c = 12**7
@memoize
def F(n):
    if n > b:
        return n - c
    else:
        return F(a + F(a + F(a + F(a + n))))

def S():
    return sum(F(n) for n in range(0,b+1))

print(F(0))
#print(S() % 10**9)
