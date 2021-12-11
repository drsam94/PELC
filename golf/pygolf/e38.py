R=range
m=0
for n in R(1,9):
 for x in R(10000):
  f=''.join(str(x*i)for i in R(n));m=max(m,int(f)*(sorted(f)==list("0123456789")))
print(m)
