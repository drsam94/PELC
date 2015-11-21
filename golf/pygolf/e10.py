R=range
print(sum(x for x in R(2,2000000)if all(x%i for i in R(2,1+int(x**.5)))))
