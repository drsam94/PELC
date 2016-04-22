from euler import rational, primes, product

def ways(n):
    w = 0

    for a in range(1, 2*n + 1):
        if (rational(1, n) - rational(1, a)).num == 1:
            w += 1
    return w

ps = primes(100)

min_val = float("inf")
for n in range(1, len(ps)):
    for k in range(0,4):
        for m in range(0,4):
            N = product(ps[:n]) * (2**k) * (3**m)
            if N < min_val:
                ws = ways(N)
                if ws > 1000:
                    min_val = N
                    print(min_val, ws)
print(min_val)
