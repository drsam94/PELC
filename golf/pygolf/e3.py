x,z=600851475143,2
while x>1:x,z=(x,x/z)[x%z<1],z+1
print(z)
