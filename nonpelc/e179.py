from euler import memoize, gcd


def extract_small_relprime_divisor(x):
    k = 2
    while k*k <= x:
        if x % k == 0:
            s = k
            n = x // k
            while n % k == 0:
                s *= k
                n //= k
            return s, naive_totient(s)
        k += 1
    return x, x -1


@memoize
def totient(x):
    if x == 1:
        return 1
    div, tot = extract_small_relprime_divisor(x)
    return tot * totient(x // div)

def naive_totient(x):
    if x == 1: return 1
    return sum(1 for k in range(1,x) if gcd(x,k) == 1)
last = 1
ans = 0
limit = 1e5
nd = 0
for n in range(3, int(1e7)):
    current = totient(n)
    if current - last == 1:
        print(n)
        if n > limit:
            print(n)
            limit += 1e5
        ans += 1
    last = current
print(ans)
