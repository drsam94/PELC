def whatPower(x as int):
    for i in range(0, 8):
        n = 7 - i
        # Not using these intermediate variables
        # causes weird errors at runtime
        y as int = (x ** (1.0 / n)) cast int
        z as int = y ** n
        if z == x:
            return n
    return 1

def refine(lst, n as int):
    return i for i as int in lst if ((i > n*100) or (i % n > 0))

def validPows(n as int) as int:
    lst = i for i in range(2, (100 * n) + 1)
    for j in range(1, n):
        lst = refine(lst, j) #i for i in lst if (i > j*100) or (i % j > 0)
    lst2 = i for i in lst if (i % n == 0)
    ans = 0
    for i in lst2:
        ans += 1
    return ans
        
def contribution(x as int) as int:
    return validPows(whatPower(x))

ans as int = 0

for i in range(2, 101):
    c = contribution(i) cast int
    #debug print code
    #print("$i : $c")
    ans += c
print ans
