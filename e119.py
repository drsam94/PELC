def digisum(N):
    return sum(int(x) for x in str(N))

def hasBackProp(b, e):
    return digisum(b**e) == b

satisfiers = []

for exp in range(2, 50):
    for base in range(2, 1000):
        if hasBackProp(base, exp):
            satisfiers.append(base ** exp)
print(sorted(satisfiers)[29])
