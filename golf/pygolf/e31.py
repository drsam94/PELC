w=lambda t,a:t==0 or(t>0and a[0])and(w(t-a[0],a)+w(t,a[1:]))
print(w(200,[1,2,5,10,20,50,100,200,0]))
