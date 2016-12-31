R=range
C=set(R(28123))
a=[x for x in C if 1+sum((i+x/i*(i*i<x))*(x%i<1)for i in R(2,int(x**.5)+1))>x>0]
print(sum(C-{i+j for i in a for j in a}))
