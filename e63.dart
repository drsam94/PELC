import "dart:math";

main() {
    num ans = 0;
    num j = 1;
    num b = 1;
    while (b < 10) {
        for (num i = b; i <= 9; ++i) {
            num pdigs = (log(pow(i,j)) / LN10 + 1).floor();
            if (pdigs == j) {
                ++ans;
            } else {
                b = (i + 1);
            }
        }
        ++j;
    }
    print(ans);
}
