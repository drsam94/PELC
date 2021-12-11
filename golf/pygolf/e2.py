g=f=s=1
while f<4e6:g,f=g+f,g;s+=-~g%2*g
print(s-1)
