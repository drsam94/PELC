t=lambda x:not((2*x/3+1/36)**.5+1/6)%1
P=[1,5]
D=1e10
n=2
while P[-1]-P[-2]<D:
 n+=1;X=n*(3*n-1)//2;P+=[X]
 for p in P[:-1]:
  if X-p>D:P=P[1:]
  elif t(X-p)*t(X+p):D=X-p
print(D)
