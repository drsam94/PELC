
def ways(x, limit):
    n = 1
    while 4*x + 8*n - 4 <= limit:
        limit -= 4*x + 8*n - 4
        n += 1
    return n - 1

print(sum(ways(x, 1e6) for x in range(1, int(1e6))))
