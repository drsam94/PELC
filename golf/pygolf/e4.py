r=range(999,1,-1)
print(max(i*j for i in r for j in r if int(str(i*j)[::-1])==i*j))
