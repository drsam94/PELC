#include<stdio.h>

int fac(int n) {
    return n < 2 ? 1 : n * fac(n - 1);
}

bool isncrbig(int n, int r) {
    //we calculate very carefully to avoid
    //overflow, and will return true as soon
    //as we see a number > 1000000
    int denom = fac(r);
    long rest = n;
    for (int i = n - 1; i > (n - r); --i) {
        rest *= i;
        if (rest / denom > 1000000) {
            return true;
        }
    }
    return false;
}

int main() {
    int min_r = 10;
    int ans = 0;
    for (int n = 23; n <= 100; ++n) {
        while (isncrbig(n, min_r - 1)) {
            --min_r;
        }
        ans += n - (2*min_r) + 1;
    }
    printf("%d\n", ans);
    return 0;
}
