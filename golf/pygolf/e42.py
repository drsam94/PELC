print(sum(not((2*sum(ord(c)-64for c in w)+.25)**.5-.5)%1for w in next(open('W'))[1:-1].split('","')))
