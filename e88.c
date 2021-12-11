#include<stdio.h>
#include<stdlib.h>

int BOUND = 12000;

/** Gets the sums of all factoriations of n, minus the number of terms in the
 *  factorization. This is most of the k-value for which n is a Product-Sum number
 *  k-value = n - factorizationSum*/

/** Admittably not the most efficient of code...this is what I get for
 *  trying to transfer code originally written in python
 */
void getAllFactorizationSums(int n, int includeself,
        int maxlength, int* output, int* outputLength) {

    /**Don't look at exceptionally long factorizations*/
    if (maxlength == 0) {
        output[0]     = -1;
        *outputLength =  1;
        return;
    }
    int*  returnValue = (int*) malloc(sizeof(int) * 15 * BOUND);
    int  rvLength = 0;
    int f;
    for (f = 2; f*f <= n; ++f) {
        if (n % f == 0) {
            getAllFactorizationSums(n / f, 1, maxlength - 1, output, outputLength);
            int j;
            for (j = 0; j < *outputLength; ++j) {
                int fSum = output[j];
                if (fSum != -1) {
                    returnValue[rvLength++] = fSum + f - 1;
                }
            }
        }
    }
    if (includeself) {
        returnValue[rvLength++] = n - 1;
    }
    //copy back to output
    int i;
    for (i = 0; i < rvLength; ++i) {
        output[i] = returnValue[i];
    }
    *outputLength = rvLength;
    free(returnValue);
} 

int min(int x, int y) { return x < y ? x : y; }

int main(int argc, char ** argv) {
    int* productSumsForK = (int*) malloc(sizeof(int) * (BOUND + 1));
    productSumsForK[0] = 0; productSumsForK[1] = 0;
    int i;
    /**Initialize with upper bounds*/
    for (i = 2; i <= BOUND; ++i) {
        productSumsForK[i] = 2 * i;
    }
    /**Allocate lots of space...most of it actually gets used!*/
    int* factorizationSums = (int*) malloc(sizeof(int) * 15 * BOUND);
    int fsLength = 0;
    int N;
    for (N = 4; N <= 2*BOUND; ++N) {
        getAllFactorizationSums(N, 0, 15, factorizationSums, &fsLength);
        for (i = 0; i < fsLength; ++i) {
            int kIndex = N - factorizationSums[i];
            if (kIndex <= BOUND) {
                productSumsForK[kIndex] = min(productSumsForK[kIndex], N);
            }
        }
    }

    //Now, we need to convert to a set to print the answer
    char set[BOUND/4];
    for (i = 0; i < BOUND/4; ++i) { set[i] = 0; }
    for (i = 0; i <= BOUND; ++i) {
        int psNum = productSumsForK[i];
        set[psNum / 8] |= (1 << (psNum % 8));
    }
    int sum = 0;
    for (i = 0; i < 2*BOUND; ++i) {
        if ((set[i / 8] >> (i % 8)) & 1) {
            sum += i;
        }
    }
    printf("%d\n", sum);
    return 0;
}
