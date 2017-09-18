from euler import gcd,memoize
@memoize
def R(k):
    return sum(10**x for x in range(0,k))

def A(n):
    if n % 2 == 0 or n % 5 == 0:
        return 0

    k = 1
    while R(k) % n > 0:
        k += 1
    return k

n = 1
while A(n) < 1e6:
    n += 1
print(n)



def Ahelper(n, digitsSoFar, carry, minAns):
    if int(digitsSoFar) >= minAns:
        return minAns
    if n == 0:
        return minAns
    ones = n % 10
    for d in range(10):
        if (d * ones) % 10 == 1:
            minAns = min(minAns, Ahelper( n//10, str(d) + digitsSoFar, (d * ones) // 10, minAns))

def Ap(n):
    return



"""
     abcde
x    fghij
    111111


"""
