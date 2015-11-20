g=f=1
s=0
while f<4e6:g,f,s=g+f,g,s+(f+1)%2*f
print(s)
