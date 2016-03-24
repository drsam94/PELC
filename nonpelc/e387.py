from euler import isPrime, digisum
def isHarshad(x):
    return x%digisum(x) == 0

def isStrongHarshad(x):
    dsum = digisum(x)
    return x%dsum == 0 and isPrime(x//dsum)

def isRTHarshad(x):
    return x < 10 or (isHarshad(x) and isRTHarshad(x//10))

N = 14
RTHarshads = [[] for n in range(0,N)]
RTHarshads[1] = [i for i in range(1,10)]

ans = 0
for n in range(2,N):
    for h in RTHarshads[n-1]:
        for k in range(0,10):
            x = h*10+k
            if isHarshad(x):
                RTHarshads[n].append(x)
    for h in RTHarshads[n]:
        if isStrongHarshad(h):
            for k in range(1,10,2):
                x = h*10+k
                if isPrime(x):
                    ans += x
print(ans)
