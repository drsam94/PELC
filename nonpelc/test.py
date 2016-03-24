poss = set()
k = {}
for p in range(300):
    for d in range(0,300):
        gen = [d]
        for i in range(1,8):
            gen.append((p*gen[i-1] + d) % 8)
        if sorted(gen) == list(range(0,8)) and tuple(gen) not in poss:
            poss.add(tuple(gen))
            k[tuple(gen)] = (d,p)


def bitchanges(x,y):
    return bin(x ^ y)[2:].count('1')

def numchanges(permut):
    return sum(bitchanges(permut[i], permut[i+1])**2 for i in range(0, len(permut) - 1))


print(max(poss, key=numchanges))
print(k[max(poss, key=numchanges)])
