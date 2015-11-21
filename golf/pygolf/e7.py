R=range
print([x for x in R(999999)if all(x%i for i in R(2,1+int(x**.5)))][10002])
