R=range
C=28123
a=[x for x in R(1,C)if 1+sum((i+(x/i)*(i*i<x))*(x%i<1)for i in R(2,int(x**.5)+1))>x]
print(sum(set(R(C))-{i+j for i in a for j in a}))
