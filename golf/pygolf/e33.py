a=b=1;q=t=10
while q<100:
 for p in range(t,q):
  if(p%t==q//t)*(q%t==p//t*q/p):a*=p;b*=q;c=b
 q+=1
while b:a,b=b,a%b
print(c/a)