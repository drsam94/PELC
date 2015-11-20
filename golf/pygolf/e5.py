g=lambda a,b:g(b,a%b)if b else a
p=1
for i in range(2,21):p=(p*i)//g(p,i)
print(p)
