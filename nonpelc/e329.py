from euler import isPrime, rational, memoize

@memoize
def isP(x):
    return isPrime(x)

@memoize
def prob(n, seq):
    if not seq:
        return rational(1)
    p = frog(isP(n), seq[0])
    if n == 1:
        return p * prob(n+1, seq[1:])
    elif n == 500:
        return p * prob(n-1, seq[1:])
    else:
        return p * rational(1,2) * ( prob(n-1, seq[1:]) + prob(n+1, seq[1:]))

@memoize
def frog(isprime, sym):
    if isprime:
        return rational(2,3) if sym == 'P' else rational(1,3)
    else:
        return rational(1,3) if sym == 'P' else rational(2,3)

s  = "PPPPNNPPPNPPNPN"
print(rational(1, 500) * sum([prob(n, s) for n in range(1, 501)], rational(0)))
