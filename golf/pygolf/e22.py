print(sum(-~i*sum(ord(a)-64for a in s)for i,s in enumerate(sorted(open('n').read()[1:-1].split('","')))))
