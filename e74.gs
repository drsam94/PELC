[indent=4]


def factChainLength(x : int) : int
    var chain = new array of int[60]
    chain[0] = x
    var cl = 1
    while cl <= 60
        x = digiFacSum(x)
        if x in chain
            return cl
        else
            chain[cl] = x
            cl++

    return cl

def digiFacSum(x : int) : int
    var ret = 0
    while x > 0
        ret += factorial(x%10)
        x   /= 10
    return ret

def factorial(x: int) : int
    if x < 2
        return 1
    else
        return x * factorial(x-1)
init
    var ans = 0
    for var i = 1 to 1000000
        if factChainLength(i) == 60
            ans += 1
    print "%d", ans
