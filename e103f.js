function sum(A) {
    var s = 0;
    for (var i = 0; i < A.length; ++i) {
        s += A[i]
    }
    return s
}

function powerSumSet(A) {
    sums = []
    maxes = []
    mins = []
    for (var i = 0; i < A.length; ++i) {
        maxes.push(0);
        mins.push(Infinity)
    }
    for (var i = 0; i < (1 << A.length); ++i) {
        nextSet = getSubSet(i, A)
        nextSum = sum(nextSet)
        if (sums.indexOf(nextSum) < 0) {
            sums.push(nextSum)
        }
        maxes[nextSet.length] = Math.max(maxes[nextSet.length], nextSum)
        mins[nextSet.length] = Math.min(mins[nextSet.length], nextSum)
    }
    return [sums, maxes, mins]
}

function getSubSet(s, set) {
    a = []
    k = 0
    while (s != 0) {
        if ((s & 1) == 1) a.push(set[k])
        k += 1
        s >>= 1
    }
    return a
}

function hasProp(s) {
    data = powerSumSet(s.slice(0, s.length - 1))
    sumset = data[0]
    maxes = data[1]
    mins  = data[2]
    for (var i = 0; i < maxes.length; ++i) {
        if (mins[i] <= s[s.length - 1] + maxes[i - 2]) {
            return false
        }
    }
    for (var i = 0; i < sumset.length; ++i) {
        if (sumset.indexOf(sumset[i] + s[s.length -1 ]) >= 0) {
            return false
        }
    }
    return true
}

// Returns the optimal set of size K, subject to compatibility with rest
var minsum = 256
function opt(K, rest) {
    if (K == 0) return rest
    var nextElem = (rest.length > 0 ? (rest[rest.length -1] + 1) : 1)
    var optimum = []
    while (minsum > sum(rest) + K * nextElem) {
        var nextSet = rest.slice(0, rest.length)
        nextSet.push(nextElem)
        if (hasProp(nextSet)) {
            var test = opt(K - 1, nextSet)
            if (test.length > 0 && sum(test) <= minsum) {
                minsum = sum(test)
                optimum = test
            }
        }
        nextElem += 1
    }
    return optimum
}
console.log(opt(7, []).join(""));
