from euler import rational

def mul(t, k):
    return tuple(e*k for e in t)
def add(t, k):
    return (t[0], k + t[1])

Id = (rational(1), rational(0))
def buildLinearEqn(seq, eqn=Id):
    if not seq:
        return eqn
    elif seq[-1] == "D":
        eqn =  mul(eqn, rational(3))
    elif seq[-1] == "U":
        eqn = mul(add(mul(eqn,rational(3)), rational(-2)), rational(1,4))
    elif seq[-1] == "d":
        eqn = mul(add(mul(eqn,rational(3)), rational(1)), rational(1,2))

    return buildLinearEqn(seq[:-1], eqn)

def applyLE(eqn, x):
    return eqn[0] * rational(x) + eqn[1]

s = "UDDDUdddDDUDDddDdDddDDUDDdUUDd"

eqn = buildLinearEqn(s)

k0 = None

for k in range(eqn[0].denom):
    M = applyLE(eqn, k)
    if M.denom == 1:
        k0 = k
        break

k = k0
while applyLE(eqn, k) < rational(1e15):
    k += eqn[0].denom

print(applyLE(eqn, k))
