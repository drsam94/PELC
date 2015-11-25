f=lambda x:x*f(x-1)if x else 1
print(sum(map(int,str(f(100)))))
