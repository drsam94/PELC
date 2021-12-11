R=range
B=10**6
P=[x for x in R(2,B)if all(x%p for p in R(2,int(x**.5)+1))]
a=b=0
l=len(P)
for i in R(l):
 for d in R(b+1,l-i):
  s=sum(P[i:i+d])
  if s>B:break
  if s in P:a,b=s,d
print(a)
