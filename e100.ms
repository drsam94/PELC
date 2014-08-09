X0 = 1
Y0 = 1
while Y0 < 1000000000000
  X1 = 3*x0 + 2*Y0 - 2
  Y1 = 4*x0 + 3*Y0 - 3
  X0 = x1
  Y0 = Y1
 
print X0
