R=range(20)
m=[list(map(int,s[:-1].split(' ')))for s in open('B').readlines()]
g=lambda i,j:m[i][j]if-1<i<20>j>-1else 0
p=lambda i,j,x,y:g(i,j)*g(i+x,j+y)*g(i+2*x,j+2*y)*g(i+3*x,j+3*y)
print(max(max(p(i,j,1,0),p(i,j,0,1),p(i,j,1,1),p(i,j,-1,1))for i in R for j in R))
