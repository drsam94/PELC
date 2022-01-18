x,z=600851475143,2
while~-x:z+=1;x//=z**(x%z<1)
print(z)