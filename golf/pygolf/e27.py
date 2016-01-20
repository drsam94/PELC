A=M=0
R=range(-1000,1000)
for a in R:
 for b in R:
  n=0;p=lambda:n*n+a*n+b
  while p()>1and all(p()%i for i in range(2,int(p()**.5))):n+=1
  if n>M:A=a*b;M=n
print(A)

