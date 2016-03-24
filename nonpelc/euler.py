from functools import wraps

_memos = {}
def memoize(f):
    _memos[f] = {}
    @wraps(f)
    def wrapper(*args, **kwargs):
        if args in _memos[f]:
            return _memos[f][args]
        else:
            _memos[f][args] = f(*args, **kwargs)
            return _memos[f][args]
    return wrapper

def isPalindrome(x):
    return x == int(str(x)[::-1])

def isPrime(x):
    return x>1 and all(x%i for i in range(2,int(x**.5+1)))

def fac(x):
    return x*fac(x-1) if x>0 else 1

def choose(n,k):
    return fac(n) // (fac(k) * fac(n-k))

def digisum(x):
    return sum(int(k) for k in str(x))

def product(lst):
    prod = 1
    for x in lst:
        prod *= x
    return prod

def primes(n):
    return [x for x in range(2,n) if isPrime(x)]

def radical(n,_primes=None):
    if not _primes:
        _primes = primes(n)
    r = 1
    for p in _primes:
        if n % p == 0:
            while n % p == 0:
                n //= p
            r *= p
        if p > n:
            return r
    return r

def gcd(a,b):
    return a if b == 0 else gcd(b,a%b)

class rational(object):
    def __add__(self, other):
        return rational(self.num*other.denom+other.num*self.denom,self.denom*other.denom)

    def __sub__(self, other):
        return self + rational(-1*other.num, other.denom)

    def __mul__(self, other):
        return rational(self.num*other.num, self.denom*other.denom)

    def inverse(self):
        return rational(self.denom, self.num)

    def __init__(self, n, d = 1):
        g = gcd(n,d)
        self.num   = n // g
        self.denom = d // g

    def __rdiv__(self, other):
        return self.inverse()

    def __str__(self):
        return "%d / %d" % (self.num , self.denom)

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        return self.num == other.num and self.denom == other.denom

    def __hash__(self):
        return hash(str(self))

    def __lt__(self, other):
        return self.num * other.denom < other.num * self.denom

    def floor(self):
        return int(self.num / self.denom)
