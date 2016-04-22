
def isDouble(x):
    return (x <= 40 and x % 2 == 0) or x == 50

def checkouts(x, k, b=(0,0)):
    w = int(isDouble(x))
    if k == 1:
        return w
    else:
        for v in range(1,21):
            for m in range(1, 4):
                if x > v*m and (v,m) >= b:
                    w += checkouts(x - v*m, k-1, (v, m))
        for vm in [25,50]:
            if x > vm and (vm, 1) >= b:
                w += checkouts(x - vm, k-1, (vm, 1))
    return w

w = 0
for x in range(1, 100):
    w += checkouts(x, 3)
print(w)


