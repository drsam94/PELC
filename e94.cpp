#include<stdio.h>
#include<cmath>

long contribution(long x) {
    long c = 0;
    // x as smaller side:
    long temp = 3 * x * x - (2 * x) - 1;
    long root = (long)sqrt((double)temp);
    if (root * root == temp) {
        c += 3 * x + 1;
    }
    // x as larger side:
    temp = 3 * x * x + (2 * x) - 1;
    root = (long)sqrt((double)temp);
    if (root * root == temp) {
        c += 3 * x - 1;
    }
    return c;
}
int main(int argc, char ** argv) {
    long ans = 0;
    //repeated side must be odd
    for (long i = 3; i * 3 < 1000000000; i+=2) {
        ans += contribution(i);
    }
    printf("%ld\n", ans);
    return 0;
}
