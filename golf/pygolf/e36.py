print(sum(x*(x==int(str(x)[::-1])==int(bin(x)[:1:-1],2))for x in range(10**6)))
