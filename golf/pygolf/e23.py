R=range
C=28123
d=lambda y:1+sum((i+(y/i)*(i*i<y))*(y%i<1)for i in R(2,int(y**.5)+1))
a=[x for x in R(1,C)if d(x)>x]
print(sum(set(R(C)).difference(i+j for i in a for j in a)))
