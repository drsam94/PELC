from decimal import *
def fac(x):
 return x*fac(x-1) if x>0 else 1
def choose(n,k):
 return fac(n) // (fac(k) * fac(n-k))
def product(lst):
 prod = 1
 for x in lst:
  prod *= x
 return prod

ways = [Decimal(0) for _ in range(0,8)]
for r in range(0,11):
 for o in range(0,min(11, 21-r)):
  for y in range(0,min(11,21-r-o)):
   for g in range(0,min(11,21-r-o-y)):
    for b in range(0,min(11,21-r-o-y-g)):
     for i in range(0,min(11,21-r-o-y-g-b)):
      v = 20 - sum([r,o,y,g,b,i])
      roygbiv = [r,o,y,g,b,i,v]
      count = sum(1 for x in roygbiv if x > 0)
      different_ways = product(choose(10,x) for x in roygbiv)
      ways[count] += Decimal(different_ways)

tot_ways = sum(ways)
EV = sum(Decimal(x) * (ways[x] / tot_ways)  for x in range(2,8))
print(EV)
