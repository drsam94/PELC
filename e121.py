
def prod(gen):
    p = 1
    for x in gen:
        p *= x
    return p

def dp(rnd, bit):
    red = rnd + 1
    return red/(red+1) if bit == 0 else 1/(red+1)

def prob_blue_disks(disks, rounds):
    p = 0
    for bitmask in bitmasks(disks, rounds):
        p += prod(dp(k, (bitmask >> k) & 1) for k in range(0,rounds))
    return p

def bitmasks(k, n):
    v = (1 << k) - 1
    while v < (1 << n):
        yield v
        t = (v | (v - 1)) + 1
        v = t | (((t & -t) // (v & -v)) >> 1) - 1

def prob_win(rounds):
    return sum(prob_blue_disks(d, rounds) for d in range(rounds//2 + 1, rounds + 1))

k = 1
p = prob_win(15)
while k*p <1:
    k += 1
print(p)
print(k - 1)
