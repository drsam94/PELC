// Somewhat trivial use of Typescript, but oh well
function LSB(x) {
    return x & -x;
}
function MSB(x) {
    var r = 1;
    while (x > 0) {
        r <<= 1;
        x >>= 1;
    }
    return r;
}
// if c is a number with n bits set,
// F is the next largest integer also with n
// bits set
function F(c) {
    var a = LSB(c);
    var b = a + c;
    return Math.floor(((b ^ c) >> 2) / a) | b;
}
function needCheck(a, b) {
    if ((a <= b) || ((a ^ b) != (a | b))) {
        return false;
    }
    else if ((LSB(a) < LSB(b)) != (MSB(a) < MSB(b))) {
        return true;
    }
    else {
        return needCheck(a - LSB(a), b - LSB(b)) || needCheck(a - MSB(a), b - LSB(b));
    }
}
var N = 12;
var ans = 0;
for (var n = 2; n <= N / 2; ++n) {
    for (var a = (1 << n) - 1; a < (1 << N); a = F(a)) {
        for (var b = (1 << n) - 1; b < (1 << N); b = F(b)) {
            if (needCheck(a, b)) {
                ans += 1;
            }
        }
    }
}
console.log(ans);
