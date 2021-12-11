p=[list(map(int,s[:-1].split(' ')))for s in open('T')]
while p:
 k=p.pop()
 for i in range(len(p)):p[-1][i]+=max(k[i:i+2])
print(k[0])
