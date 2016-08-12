R=range
c=x=0
while c<4:c+=1if len([0for f in R(2,x//30)if x%f<1and all(f%i for i in R(2,int(f**.5)+1))])==4else-c;x+=1
print(x-4)
