R=range(1,5000)
print(sum({a*b*(sorted("%s%s%s"%(a,b,a*b))==list('123456789'))for a in R for b in R}))