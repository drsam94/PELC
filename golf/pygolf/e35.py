c=0
for x in range(2,10**6):s=str(x);k=len(s);c+=all((lambda x:all(x%i for i in range(2,1+int(x**.5))))(int((s+s)[i:i+k]))for i in range(k))
print(c)
