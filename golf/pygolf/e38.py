f=lambda n,N:''.join(str(n*i)for i in range(1,N))
print(max(int(f(x,n))*(sorted(f(x,n))==list("123456789"))for x in range(10000)for n in range(2,9)))
