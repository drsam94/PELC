r=range(999)
print(max(i*j*(int(str(i*j)[::-1])==i*j)for i in r for j in r))
