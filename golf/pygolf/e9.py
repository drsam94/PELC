t=1000;r=range(2,t)
print([a*b*(t-a-b)for a in r for b in r if(a**2+b**2)**.5+a+b==t][0])
