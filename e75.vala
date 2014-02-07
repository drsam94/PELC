
int gcd(int a, int b) {
    if (b == 0) {
        return a;
    } else {
        return gcd(b, a%b);
    }
}

bool coprime(int a, int b) {
    return gcd(a, b) == 1;
}

bool odd(int x) {
    return x%2 == 1;
}

/** Returns the perimeter of the primitive pythagorean triple
    generated by m and n, assuming m, n coprime and m - n odd */
int euclid(int m, int n) {
    return 2*m*m + 2*m*n;
}

void main () {

    int[] L = new int[1500001];
    for (int i = 0; i <= 1500000; ++i) {
        L[i] = 0;
    }
    
    int ans = 0;
    int m = 1;
    int n = 1;
    int p = 0;
    while (n <= 1000) {
        m = n + 1;
        while (m <= 1000) {
            if (odd(m - n) && coprime(m, n)) {
                p = euclid(m, n);
                int k = 1;
                while (p*k <= 1500000) {
                  //  stdout.printf("%d\n", p*k);
                    if (L[p*k] == 0) {
                        ++ans;
                        L[p*k]++;
                    } else if (L[p*k] == 1) {
                        --ans;
                        L[p*k]++;
                    }
                    ++k;
                }
            }
            ++m;
        }
        ++n;
    }
    stdout.printf ("%d\n", ans);
}