p=k=1
while k<6:v=int(str(10-k)+"1"*k);k+=1;p*=int(str(10**~-k+v//k)[~-v%k])
print(p)
