print(max(i*j for i in range(999,1,-1)for j in range(i,1,-1)if int(str(i*j)[::-1])==i*j))
