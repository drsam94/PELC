R=range
f=lambda x:x*f(x-1)if x else 1
def L(N,p,r):
 q=len(r)
 if q<2:return p+r
 k=f(q-1);p+=[r[N//k]];r.remove(p[-1]);return L(N%k,p,r)
T=0
for i in R(f(10)):
 X="".join(L(i,[],list(map(str,R(10)))));T+=int(X)*all(1>int(X[k+1:k+4])%(2,3,5,7,11,13,17)[k]for k in R(7))
print(T)
