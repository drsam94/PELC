F = [0, 1]

def fib(n):
    if n == len(F):
        F.append(fib(n - 1) + fib(n - 2))
    return F[n]

pan = ['1','2','3','4','5','6','7','8','9']
i = 0
while True:
    x = fib(i)
    tail = list(str(x % 1000000000))
    tail.sort()
    if tail == pan:
        head = list(str(x)[:9])
        head.sort()
        if head == pan:
            print(i)
            break
    i += 1
