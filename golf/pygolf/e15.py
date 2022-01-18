f=lambda x:x*f(x-1)if x else 1
print(f(40)//f(20)**2)