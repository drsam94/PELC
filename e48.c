#include<stdio.h>

int main(int argc, char** argv) {
    const unsigned long long BIG  = 10000000000;
    unsigned long long ans       = 0;
    unsigned long long summand   = 0;
    unsigned long long i;
    unsigned long long j;
    for (i = 1; i <= 1000; ++i) {
        summand = i;
        for (j = 1; j < i; ++ j) {
            summand *= i;
            summand %= BIG;
        }
        ans += summand;
        ans %= BIG;
    }
    printf("%lld\n",ans);
}
