x,z=600851475143,2
while x>1:
 z+=1
 x/=1 if x%z else z
print(z)
