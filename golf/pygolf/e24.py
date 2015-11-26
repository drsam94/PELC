f=lambda x:x*f(x-1)if x else 1;r=range(10);d=list(r);p=999999;s=''
for i in r:s+=str(d.pop(p//f(9-i)));p%=f(9-i)
print(s)
