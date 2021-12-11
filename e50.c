#include<stdio.h>
#include<stdlib.h>

int isPrime(int n) {
    if (n < 2 || n % 2 == 0) {
        return n == 2;
    }
    int i = 3;
    for (i = 3; i*i <= n; ++i) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int partialSum(int* arr, int begin, int end) {
    int sum = 0;
    int i;
    for (i = begin; i < end; ++i) {
        sum += arr[i];
    }
    return sum;
}

int main(int argc, char** argv) {
    int ans = 0;
    int chainLength = 1;
    //78498 = pi^-1(1000000)
    int* primes = (int*)malloc(78498 * sizeof(int));
    int i = 2;
    int c = 0;
    //make list of primes
    for (i = 0; i < 1000000; ++i) {
        if (isPrime(i)) {
            primes[c] = i;
            ++c;
        }
    }
    int j;
    for (i = 0; i < 78498; ++i) {
        for (j = i+chainLength; j < 78498; ++j) {
            int temp = partialSum(primes,i,j);
            if (temp > 1000000) {
                break;
            }
            if (isPrime(temp)) {
                ans = temp > ans ? temp : ans;
                chainLength = j - i;
            }
        }
    }
    printf("%d\n",ans);
    return 0;
} 

