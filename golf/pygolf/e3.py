x,z=600851475143,2
while x>1:x,z=x if x%z else x/z,z+1
print(z)
