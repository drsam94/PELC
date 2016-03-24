def fac(x):
    return x*fac(x - 1) if x else 1

def choose(n , k):
    return fac(n) // (fac(k) * fac(n - k))

def count_helper(n, num):
    if num == 1:
        count = 1 # all filled
        for k in range(1, n):
            count += (choose(n - 1, k) * 13 * 14**(n - 1 - k) +
                      choose(n - 1, k - 1) * 14**(n - k))
    elif num == 2:
        count = 0
        for k in range(2, n + 1):
            count += choose(n , k) * 13**(n - k) * (2**k - 2)
    return count

def num_without(n):
    no_a = 14 * 15**(n - 1)
    return no_a + count_helper(n, 1) + count_helper(n, 2)

def total_available(n):
    return 15 * 16**(n - 1)

print(hex(sum(total_available(k) - num_without(k) for k in range(3, 17))).upper()[2:])
