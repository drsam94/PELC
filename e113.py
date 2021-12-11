
N = 100
inc = [[0 for i in range(0, 10)] for k in range(0, N+1)]
dec = [[0 for i in range(0, 10)] for k in range(0, N+1)]

inc[1] = [0] + [1 for i in range(1, 10)]
dec[1] = [0] + [1 for i in range(1, 10)]

incdec = [[1 for i in range(1,10)] for k in range(0,N+1)]
for n in range(1, N):
    for k in range(1, 10):
        inc[n+1][k] = sum(inc[n][i] for i in range(k,10))
        dec[n+1][k] = 1 + sum(dec[n][i] for i in range(1, k+1))

print([(sum(inc[n]), sum(dec[n])) for n in range(1, N+1)])
print(sum(sum(inc[n]) + sum(dec[n]) - sum(incdec[n]) for n in range(1, N+1)))
