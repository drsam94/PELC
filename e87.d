import std.stdio;
import std.math;
import std.conv;

/** Writing all the casts is annoying */
int isqrt(int x) {
    return to!int(floor(sqrt(to!float(x))));
}

/** "Basic" Prime Sieve */
int[] sieve(int bound) {
    int[] partial;
    int rbound = isqrt(bound);
    if (bound < 11) {
        return [2, 3, 5, 7];
    } else {
        partial = sieve(rbound);
    }
    int current = rbound;
    if (current % 2 == 0) {
        current += 1;
    }
    int[] newprimes = partial;
    while (current < bound) {
        bool isprime = true;
        int rcurrent = isqrt(current);
        foreach (p; partial) {
            if (p > rcurrent) {
                break;
            }
            if (current % p == 0) {
                isprime = false;
                break;
            }
        }
        if (isprime) {
            newprimes ~= current;
        }
        current += 2;
    }
    return newprimes;
}

int BOUND = 50000000;
/**Set implemented with array of bits
   Not only done for space efficiency, D does not
   allow static arrays with 50000000 elements (at least by default).
   */
uint[50000000/32 + 1] is23sum;

void setIsSum(int elem) {
    if (!isSum(elem)) {
        is23sum[elem / 32] += 1 << (elem % 32);
    }
}

bool isSum(int elem) {
    return ((is23sum[elem / 32] >> (elem % 32)) & 1) > 0;
}
void main() {
    // Get all necessary primes
    int[] primes = sieve(isqrt(BOUND));
    // Precompute arrays
    int[] primes2;
    foreach (p ; primes ) { 
        primes2 ~= pow(p , 2); 
    }
    int[] primes3;
    foreach (p ; primes ) {
        int temp = pow(p, 3);
        if (temp > BOUND) { 
           break;
        } else { 
           primes3 ~= temp;
        }
    }
    int[] primes4;
    foreach (p; primes) {
        int temp = pow(p, 4);
        if (temp > BOUND) {
            break;
        } else {
            primes4 ~= temp;
        }
    }
    is23sum[] = 0;
    // Precompute all numbers that are sums of squares and cubes
    foreach (p2; primes2) {
        foreach (p3; primes3) {
            int s = p2 + p3;
            if (s < BOUND) {
                setIsSum(s);
            }
        }
    }
    int ans = 0;
    // Checking for sum of square, cube, and 4th power
    foreach(i; 27 .. BOUND) {
        foreach (p4; primes4) {
            if ( (i - p4) < 12) {
                break;
            } else if (isSum(i - p4)) {
                ans = ans + 1;
                break;
            }
        }
    }
    writeln(ans);
}
