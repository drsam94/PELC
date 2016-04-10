R=range
print(sorted(list(R(1001)),key=lambda p:-sum(a**2+b**2==(p-a-b)**2for a in R(p//3+1)for b in R(1,(p-a)//2)))[0])
