g,f,s=1,1,0
while f<4e6:g,f,s=g+f,g,s+(f+1)%2*f
print(s)
