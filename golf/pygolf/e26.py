a=b=0
for d in range(2,1000):
 f=x=1;p={}
 while~-(f in p):p[f]=x=x+1;f=f*10%d
 q=x-p[f]
 if q>a:a=q;b=d
print(b)
