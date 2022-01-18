f=lambda x:x*f(x-1)if x else 1
print(sum(x for x in range(3,100000)if sum(map(f,map(int,str(x))))==x))