y=m=d=w=s=0
while y<101:
 w=-~w%7;d+=1
 if(32-(m in(3,4,8,10)),29+(y>0)*(y%4<1))[m==1]==d:m=-~m%12;y+=m<1;d=0;s+=(0<y)&(w>5)
print(s)