from euler import choose, squarefree, primes

N = 51
ps = primes(int(choose(N-1,(N-1)//2)**.5))
print("got primes")
sfrees = set()
for n in range(0,N):
    for k in range(0,(n+3)//2):
        coeff = choose(n,k)
        if squarefree(coeff,ps):
            sfrees.add(coeff)
print(sum(sfrees))
