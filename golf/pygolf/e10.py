R=range
print(sum(x*all(x%i for i in R(2,1+int(x**.5)))for x in R(2,2000000)))
