R=range
f=lambda x:x*f(x-1)if x else 1
def L(N,p,r):
 q=len(r)
 if q<2:return p+r
 k=f(q-1);p+=[r[N//k]];r.remove(p[-1]);return L(N%k,p,r)
m=1
for n in R(4,10):
 for i in R(f(n)):
  k=0
  for z in L(i,[],list(R(1,n+1))):k*=10;k+=z
  if all(k%i for i in R(2,int(k**.5+1))):m=max(m,k)
print(m)
