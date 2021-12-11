numeric digits 20

i = 144
do forever
h = hex(i)
if isPent(h) then
do
say h
leave
end
i = i + 1
end

isPent:
parse arg p
a = sqrt(24*p+1)
return (a*a = 24*p+1) & ((a+1) // 6 = 0)

hex:
parse arg n
return n*(2*n-1)

sqrt:
parse arg N
x1 = N % 2
x2 = N
do while (x2 - x1) > 1
x2 = x1
x1 = (x1 + (N % x1) ) % 2
end
return x2

