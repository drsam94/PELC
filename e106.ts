// Somewhat trivial use of Typescript, but oh well
function LSB(x: number): number {
    return x & -x;
}

function MSB(x: number): number {
    let r = 1;
    while (x > 0) {
        r <<= 1;
        x >>= 1;
    }
    return r;
}

// if c is a number with n bits set,
// F is the next largest integer also with n
// bits set
function F(c: number): number {
    const a: number = LSB(c);
    const b: number = a + c;
    return Math.floor(((b ^ c) >> 2) / a) | b;
}

function needCheck(a: number, b: number): boolean {
    if ((a <= b) || ((a ^ b) != (a | b))) {
        return false;
    } else if ((LSB(a) < LSB(b)) != (MSB(a) < MSB(b))) {
        return true;
    } else {
        return needCheck(a - LSB(a), b - LSB(b)) || needCheck(a - MSB(a), b - LSB(b));
    }
}

const N: number = 12;

let ans: number = 0;
for (let n: number = 2; n <= N / 2; ++n) {
    for (let a: number = (1 << n) - 1; a < (1 << N); a = F(a)) {
        for (let b: number = (1 << n) - 1; b < (1 << N); b = F(b)) {
            if (needCheck(a, b)) {
                ans += 1;
            }
        }
    }
}
console.log(ans)
