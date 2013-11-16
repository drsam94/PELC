class Rational {
    int n, d;
    static int gcd(a, b) =>
        b == 0 ? a : gcd(b, a%b);

    Rational(int top, int bottom) :
        n = top ~/ gcd(top, bottom), d = bottom ~/ gcd(top, bottom) {}

    operator +(Rational other) => 
        new Rational(this.n*other.d + other.n*this.d, other.d*this.d);

    Rational inverse() => new Rational(this.d, this.n);
}

int digisum(x) => x < 10 ? x : x%10 + digisum(x~/10);

int coeff(n) => n == 1 ? 2 : (n % 3 == 0 ? 2*(n~/3) : 1);

Rational nextDepth(n,N) {
    if (n == N) {
        return new Rational(1,coeff(n));
    } else {
        return new Rational(coeff(n),1) + nextDepth(n+1,N).inverse();
    }
}

Rational nthConv(n) => nextDepth(1,n); 

main() {
    print(digisum(nthConv(100).n));
}
