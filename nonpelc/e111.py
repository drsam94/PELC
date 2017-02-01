from euler import isPrime
from itertools import permutations
N = 10
ans = 0
for d in range(0, 10):
    for M in range(N-1, 1, -1):
        curr = set() # make sure we don't repeat answers
        for extra in range(0, 10**(N-M)):
            for locs in permutations(range(0, N), N-M):
                # build string defaulting to digit d, and filling in
                # with permutations of other digits
                num = [str(d)] * N
                for loc,digit in zip(locs,str(extra)):
                    num[loc] = digit
                num = int("".join(num))
                if num < 10**(N-1):
                    continue
                if num in curr:
                    continue
                elif isPrime(num):
                    curr.add(num)
        if len(curr) > 0:
            ans += sum(curr)
            break
print(ans)     
