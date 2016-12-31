R=range
B=1000000
P=[x for x in R(2,B) if all(x%p for p in R(2,int(x**.5)+1))]
b=(0,0)
for i in R(len(P)):
 for d in R(b[1]+1,len(P)-i):
  s=sum(ps[i:i+d])
  if s>B:break
  if s in P b=(s,d)
print(b[0])
