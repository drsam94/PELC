print(next(H for H in(n*(2*n-1)for n in range(144,100000))if not((2*H/3+1/36)**.5+1/6)%1))
