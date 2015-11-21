d,p=open('8').read(),lambda x:int(x[0])*p(x[1:])if x else 1
print(max(p(d[k:k+13])for k in range(len(d)-13)))
