p=lambda x:(x>1)*all(x%i for i in range(2,1+int(x**.5)))
t=c=x=9
while c<20:
 s=str(x)
 if all(p(int(s[i:]))*p(int(s[:i+1]))for i in range(len(s))):t+=x;c+=1
 x+=1
print(t-9)