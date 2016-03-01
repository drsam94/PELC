def isPalindrome(x):
    return x == int(str(x)[::-1])

def f(s, l):
    return sum(x**2 for x in range(s, s+l))

nums = set()
for start in range(1, 10000):
    for length in range(2, 10000):
        n = f(start, length)
        if n > 1e8:
            break
        elif isPalindrome(n):
            nums.add(n)
            print(n)
print(sum(nums))
