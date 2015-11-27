a=b=0
for d in range(2,1000):
 f=x=1;p={}
 while~-(f in p):p[f]=x;f=f*10%d;x+=1
 if x-p[f]>a:a=x-p[f];b=d
print(b)
