R=range
print(next(x for x in R(10000)if x%2*all(((x-i)/2)**.5%1 for i in R(x+1)if all(i%j for j in R(2,int(i**.5)+1)))))
