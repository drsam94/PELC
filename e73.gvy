
def gcd(a,b) {
    if (b == 0) {
        return a
    } else {
        return gcd(b, a%b)
    }
}

def numFracs(int d) {
    int low  = d / 3 + 1
    int high = d / 2
    ret = 0
    for (i in low..high) {
        if (gcd(i,d) == 1) {
            ++ret
        }
    }
    return ret
}

ans = 0
for (i in 4..12000) {
    ans += numFracs(i)
}
println ans


