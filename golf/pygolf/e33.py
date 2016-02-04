a=b=1
R=range
for q in R(10,100):
 for p in R(10,q):
  if p%10==q//10and q%10and p/q==p//10/q%10:a*=p;b*=q
g=lambda a,b:a if b==0else g(b,a%b)
print(b/g(a,b))
