a=10**10
print(sum(pow(x,x,a)for x in range(1,1001))%a)
