from euler import primes, product, inf

# we want min { n | |{(x,y)| 1/x + 1/y = 1/n}| >= 1e6 }

# now let's analyze the condition, if it is true, then
# 1/n - 1/y = 1/x, i.e
# y - n / ny = 1/x
# ny % (y - n) == 0
#
# So, we want
# min { n | |{y > n | ny % (y - n) == 0}| >= 1e6}
# but if we write y = n + k, this condition becomes
# n(n + k) % k == 0, which is true when
# n^2 + nk % k == 0,
# n^2 % k == 0
# ergo, we really want the min n such that #divisors of n^2 is > 1e6

# so, we want least n such that sigma_0(n**2) >= 1e6

# equivalently, we want integers [a_0, a_1, a_2, ...] such that
# prod(2*a_i + 1) > 1e6 and
# prod(p_i**a_i) is minimized


ps = primes(1000)
THRESH = 4e6
minanslen = 0
def getans(asl, minans):
    global minanslen
    candidate = product(p**a for p, a in zip(ps, asl))
    if candidate >= minans:
        return minans
    prod = product(2*a + 1 for a in asl)
    if prod > 2*THRESH:
        print((candidate, asl, product(2*a + 1 for a in asl)))
        minans = candidate
        minanslen = len(asl)
    if all(a == 1 for a in asl):
        minans = getans(asl + [1], minans)
    for j in range(len(asl)):
        ascpy = asl[:]
        ascpy[j] += 1
        if j > 0 and ascpy[j] > ascpy[j - 1]:
            continue
        if ascpy[j] > 10:
            break
        minans = getans(ascpy, minans)
        if len(asl) < minanslen - 2:
            return minans
    return minans

print(getans([], inf()))
