print(sum(-~i*sum(ord(a)-64for a in s)for i,s in enumerate(sorted(next(open('n'))[1:-1].split('","')))))
