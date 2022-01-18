R=range
print([x for x in R(10**6)if all(x%i for i in R(2,1+int(x**.5)))][10002])