from math import log

#@memoize
def f(n,u1=set(),u2=set(),mx=None):
    if not mx:
        mx = n
    if n < 1:
        return 1 if n == 0 else 0
    else:
        ans = 0
        for k in range(0, min(mx+1,int(log(n,2))+1)):
            p = 2**k
            if p in u2:
                continue
            elif p in u1:
                ans += f(n-p,u1 - {p}, u2 | {p}, min(mx,k))
            else:
                ans += f(n-p, u1 | {p}, u2, min(mx,k))
        return ans

print(f(10))
