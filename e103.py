N = 47
K = 7

def F(c):
    a = c & -c
    b = a + c
    return (((b ^ c) >> 2)//a) | b

def getSet(s):
    a = []
    k = 1
    while s != 0:
        if (s & 1) == 1: a.append(k)
        k += 1
        s >>= 1
    return a

def getSubSet(s, set):
    a = []
    k = 0
    while s != 0:
        if (s & 1) == 1: a.append(set[k])
        k += 1
        s >>= 1
    return a

S = sum

def hasProp(set):
    if (set[1] < K): return False

    for i in range(1, K//2):
        if S(set[0:i+1]) <= S(set[K-1:K]):
            return False

    for n in range(1, len(set)):
        s = (1 << n) - 1
        while s < (1 << len(set)) - 1:
            A = getSubSet(s, set)
            for m in range(n, len(set)):
                t = (1 << m) - 1
                while t < (1 << len(set)) - 1:
                    B = getSubSet(t, set);
                    if ((S(A) == S(B)) or ((m > n)  and (S(A) >  S(B)))) and (A != B):
                        return False
                    t = F(t)
            s = F(s)
    return True

minsum = 115 + (7 * 19)
minset = []
s = (1 << K) - 1
while s < (1 << N) - 1:
    sp = getSet(s)
    #print(sp)
    SUM = S(sp)
    if SUM < minsum and hasProp(sp):
        minset = sp
        minsum = SUM
    s = F(s)
print(minset)
