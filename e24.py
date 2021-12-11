def fac(x):
    return 1 if x < 2 else x * fac(x-1)

#p is the list of predetermined digits (in order)
#rem is the list of digits left
def NthLP(N, p, rem):
    if len(rem) == 1:
        return p + rem
    k = fac(len(rem) - 1)
    timesDivided = int(N / k)
    print(timesDivided +1)
    p.append(rem[timesDivided])
    rem.remove(p[-1])
    return NthLP(N % k, p, rem)

digits = NthLP(int(999999), [], [i for i in range(0,10)])
s = ""
for d in digits:
    s += str(d)
print s
