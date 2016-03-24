
def trimTZ(x):
    while x%10 == 0:
        x//=10
    return x

def f(N):
    (trimTZ(N) * f(N- 1))%10000 *
