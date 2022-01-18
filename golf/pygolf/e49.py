R=range
P=lambda x:all(x%p for p in R(2,int(x**.5)+1))
I=lambda x:sorted(str(x))
X=lambda x,y,z:map(x,(y,y+z,y+2*z))
print(next("".join(X(str,p,d))for p in R(1001,10000,2)for d in R(100,5000-p//2,2)if p!=1487and all(X(P,p,d))and I(p)==I(p+d)==I(p+2*d)))