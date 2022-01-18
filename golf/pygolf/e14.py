c=lambda x:x>1 and-~(c(3*x+1)if x%2else c(x/2))
l=list(map(c,range(10**6)))
print(l.index(max(l)))