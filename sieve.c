#include<stdio.h>
#include<stdlib.h>
#include<math.h>

/** Very brute force sieve
 *  Always checks 2..n-1
 */
int isPrimeDumbest(int n) {
    int i;
    for (i = 2; i < n - 1; ++i) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

/** Mostly brute force, but checks
 *  2..n-1
 */
int isPrimeSqrt(int n) {
    int i;
    for (i = 2; i*i <= n; ++i) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

/** Checks for 2 explicitly, then does a += 2 */
int isPrimeSqrt2(int n) {
    if (n % 2 == 0) { return n == 2; }
    int i;
    for (i = 3; i*i <= n; i+=2) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

/** Sieves out both 2 and 3 */
int isPrimeSqrt23(int n) {
    if (n % 2 == 0) { return n == 2; }
    if (n % 3 == 0) { return n == 3; }
    int i;
    for (i = 3; i*i <= n; i += (i % 3 == 1 ? 4 : 2)) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

/** Function that takes one of the isPrime Methods above
 *  and sieves:
 *  For consistency, all sieves know 2 is prime
 *  and then check all odds
 */
void mostSieves(int bound, int* primes, int* primeslength, int (*sieveFunc)(int)) {
    primes[0] = 2;
    int c = 1;
    int i;
    for (i = 3; i < bound; i+=2) {
        if (sieveFunc(i)) {
            primes[c++] = i;
        }
    }
    *primeslength = c;
}
/** Recursively determines prime lists
 *  So that mods are only taken for
 *  primes <= sqrt */
void smartSieve(int bound, int* primes, int* primeslength) {
    if (bound < 11) {
        primes[0] = 2; primes[1] = 3; primes[2] = 5; primes[3] = 7;
        *primeslength = 4;
        return;
    }
    int rbound = (int)sqrt(bound * 1.0f);
    smartSieve(rbound, primes, primeslength);
    int partialLength = *primeslength;
    int mLength       = partialLength;
    int current = rbound;
    if (current % 2 == 0) { ++current; }
    while (current < bound) {
        int isprime = 1;
        int i ;
        for (i = 0; i < partialLength; ++i) {
            int p = primes[i];
            if (p*p > current) {
                break;
            } else if (current % p == 0) {
                isprime = 0;
                break;
            }
        }
        if (isprime) {
            primes[mLength++] = current;
        }
        current += 2;
    }
    *primeslength = mLength;
    return; 
}

/** For some reason this didn't occur to me for a really long time */
void smartestSieve(int bound, int* primes, int* primeslength) {
    primes[0] = 2; primes[1] = 3; primes[2] = 5; int mLength = 3;
    int n;
    for (n = 7; n < bound; n += 2 * ((2*n) % 3)) {
        int isprime = 1;
        int i;
        for (i = 2; i < mLength; ++i) {
            int p = primes[i];
            if (p*p > n) {
                break;
            } else if (n % p == 0) {
                isprime = 0;
                break;
            }
        }
        if (isprime) {
            primes[mLength++] = n;
        }
    }
    *primeslength = mLength;
}

int main(int argc, char** argv) {
    if (argc < 3) { 
        printf("%s\n", "Not enough arguments");
        return 1;
    }
    int fchoice  = atoi(argv[1]);
    int bound    = atoi(argv[2]);
    int numtimes = atoi(argv[3]);
    /** Allocate an over estimate in the beginning
     *  So that resizing does not effect times
     */
    int* primes = (int*)malloc(bound * sizeof(int));
    // Why not use this place in memory for this...
    int primeslength = 0;
    int i;
    for (i = 0; i < numtimes; ++i) {
    switch(fchoice) {
        case 0:
            mostSieves(bound, primes, &primeslength, &isPrimeDumbest);
            break;
        case 1:
            mostSieves(bound, primes, &primeslength, &isPrimeSqrt);
            break;
        case 2:
            mostSieves(bound, primes, &primeslength, &isPrimeSqrt2);
            break;
        case 3:
            mostSieves(bound, primes, &primeslength, &isPrimeSqrt23);
            break;
        case 4:
            smartSieve(bound, primes, &primeslength);
            break;
        case 5:
            smartestSieve(bound, primes, &primeslength);
            break;
        default:
            printf("Not a valid choice\n");
            return 1;
    }
    }
    long sum = 0;
    for (i = 0; i < primeslength; ++i) {
        sum += primes[i];
    }
    printf("%ld\n", sum);
    return 0; 
}
