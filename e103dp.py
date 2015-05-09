def powerSumSet(A):
    sums = set([])
    maxes = [0 for i in range(0, len(A) + 1)]
    mins = [sum(A) for i in range(0, len(A) + 1)]
    for i in range(0, 2 ** len(A)):
        nextSet = getSubSet(i, A)
        nextSum = sum(nextSet)
        sums.add(nextSum)
        maxes[len(nextSet)] = max(maxes[len(nextSet)], nextSum)
        mins[len(nextSet)] = min(mins[len(nextSet)], nextSum)
    return sums, maxes, mins

def getSubSet(s, set):
    a = []
    k = 0
    while s != 0:
        if (s & 1) == 1: a.append(set[k])
        k += 1
        s >>= 1
    return a

def hasProp(s):
    sumset, maxes, mins = powerSumSet(s[:-1])
    for i in range(2, len(maxes)):
        if mins[i] <= s[-1] + maxes[i - 2]: return False
    for elem in sumset:
        if elem + s[-1] in sumset: return False
    return True

# Returns the optimal set of size K, subject to compatibility with rest
minsum = 256
def opt(K, rest):
    global minsum
    if K == 0: return rest
    if len(rest) > 0:
        nextElem = rest[-1] + 1
    else:
        nextElem = 1
    optimum = []
    while (minsum > sum(rest) + K * nextElem):
        nextSet = rest + [nextElem]
        if hasProp(nextSet):
            test = opt(K - 1, nextSet)
            if len(test) > 0 and sum(test) <= minsum:
                minsum = sum(test)
                optimum = test
        nextElem += 1
    return optimum

print ("".join(map(str,(opt(7, [])))))
