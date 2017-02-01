from euler import isPrime, product
from itertools import permutations

count = 0
uniq_prods = set()

def get_num(permut, end):
    num = 0
    for digit in permut[:end+1]:
        num *= 10
        num += digit
    return num

def count_sets(permut, prev):
    global count
    if not permut:
        prod = product(prev)
        if prod not in uniq_prods:
            uniq_prods.add(prod)
            count += 1

    for end in range(len(permut)):
        candidate = get_num(permut, end)
        if isPrime(candidate):
            count_sets(permut[end+1:], prev + [candidate])
for permut in permutations(range(1,10)):
    count_sets(permut, [])
print(count)
