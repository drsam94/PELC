d=lambda x:sum(i*(x%i<1)for i in range(1,x))
print(sum(x*(d(d(x))==x!=d(x))for x in range(10000)))