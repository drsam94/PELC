# By binomial expansion, (a-1)^n + (a+1)^n % a^2 = 2 if a is even, 2na % a^2 otherwise
print(sum(max( (2*(2*k+1)*a) % (a**2) for k in range(0, 1000)) for a in range(3,1001)))
