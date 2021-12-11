def isPrime(x):
    if x < 2:
        return False
    elif x % 2 == 0:
        return x == 2
    i = 3
    while i * i <= x:
        if x % i == 0:
            return False
        i += 1
    return True

def mag(x):
    return 10 if x < 10 else  10 * mag(x // 10)

def concat(x, y):
    return x * mag(y) + y

def getPrimes(N):
    return [x for x in range(N+1) if isPrime(x)]

def satisfies(p,s):
    return all(isPrime(concat(e, p)) and isPrime(concat(p, e)) for e in s)

primes = getPrimes(10000)

def finishSet(s, target, start):
    if len(s) == 5:
        test = sum(s)
        return test if test < target else target
    else:
        for i in range(start, len(primes)):
            p = primes[i]
            if satisfies(p,s):
                cset = s[:]
                cset.append(p)
                test = finishSet(cset,target,i)
                if test < target:
                    target = test
                    break
        return target

print(finishSet([],10000000,0))
