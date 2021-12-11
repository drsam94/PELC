def hyper(base, exp, N):
    e = 1
    for i in range(0,exp):
        e = pow(base, e, N)
    return e

print(hyper(1777,1855,int(1e8)))
