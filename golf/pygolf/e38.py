R=range
f=lambda n,N:''.join(str(n*i)for i in R(1,N))
print(max(int(f(x,n))*(sorted(f(x,n))==list("123456789"))for x in R(10000)for n in R(2,9)))
