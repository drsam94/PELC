
def LSB(x):
    return x & -x

def MSB(x):
    r = 1;
    while x > 0:
        r <<= 1
        x >>= 1
    return r

def F(c):
    a = LSB(c)
    b = a + c
    return (((b ^ c) >> 2)//a) | b

def needCheck(a, b):
    if (a <= b) or (a ^ b != a | b):
        return False
    elif (LSB(a) < LSB(b)) ^ (MSB(a) < MSB(b)):
        return True
    else:
        return needCheck(a - LSB(a), b - LSB(b)) or needCheck(a - MSB(a), b - LSB(b))

N = 12

ans = 0
for n in range(2, N//2 + 1):
    a = (1 << n) - 1
    while a < (1 << N):
        b = (1 << n) - 1
        while b < (1 << N):
            if needCheck(a, b):
                print(a, b)
                ans += 1
            b = F(b)
        a = F(a)
print(ans)
