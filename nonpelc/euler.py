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

def choose(n,k, rat=False):
    c = rational(fac(n), fac(k) * fac(n - k))
    return c if rat else int(c)

def digisum(x):
    return sum(int(k) for k in str(x))

def product(lst):
    prod = 1
    for x in lst:
        prod *= x
    return prod

def primes(n):
    if n <= 10:
        return [2,3,5,7]
    else:
        base = max(10, int(n**.5 + 1))
        sievers = primes(base)
        if base % 2 == 0:
            base += 1
        new_ps = []
        for x in range(base, n, 2):
            isp = True
            for p in sievers:
                if p*p > x:
                    break
                elif x % p == 0:
                    isp = False
                    break
            if isp:
                new_ps.append(x)
        return sievers + new_ps

def squarefree(n, _primes=None):
    if not _primes:
        _primes = primes(n)
    for p in _primes:
        if p**2 > n:
            return True
        elif n % p**2 == 0:
            return False
    return True

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

def numDigits(x):
    return len(str(x))

def gcd(a,b):
    return a if b == 0 else gcd(b,a%b)

def inf():
    return float("inf")

class rational(object):
    def __add__(self, other):
        if isinstance(other, int):
            other = rational(other)
        return rational(self.num*other.denom+other.num*self.denom,self.denom*other.denom)

    def __sub__(self, other):
        return self + (rational(other.num, other.denom) * -1)

    def __mul__(self, other):
        if isinstance(other, int):
            other = rational(other)
        return rational(self.num*other.num, self.denom*other.denom)

    def inverse(self):
        return rational(self.denom, self.num)

    def __init__(self, n, d = 1):
        g = gcd(n,d)
        self.num   = n // g
        self.denom = d // g

    def __int__(self):
        return self.num // self.denom

    def __float__(self):
        return self.num / self.denom

    def __complex__(self):
        return float(self)

    def __str__(self):
        return "%d / %d" % (self.num , self.denom)

    def __repr__(self):
        return str(self)

    def __eq__(self, other):
        if isinstance(other, int):
            other = rational(other)
        return self.num == other.num and self.denom == other.denom

    def __hash__(self):
        return hash(str(self))

    def __lt__(self, other):
        if isinstance(other, int):
            other = rational(other)
        return self.num * other.denom < other.num * self.denom

    def floor(self):
        return int(self.num / self.denom)
