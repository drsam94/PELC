p=k=1
while k<6:k+=1;v=int("%d%s"%(11-k,"1"*~-k));p*=int(str(10**~-k+v//k)[~-v%k])
print(p)
