
// We need to perform bitwise operations on >32 bit
// integers, which js does not support, so we have a
// BigInt which is a tuple of two integers
type BigInt = [number, number];

function low(x: number): number {
    return x % (Math.pow(2, 32) - 1);
}

function fromNum(x: number): BigInt {
    return [low(x), Math.floor(x / Math.pow(2, 32))]
}

function toNum([x1, x2]: BigInt): number {
    return x1 + Math.pow(2, 32) * x2;
}

function bigAnd([x1, x2]: BigInt, [y1, y2]: BigInt): BigInt {
    return [x1 & y1, x2 & y2];
}

function bigXor([x1, x2]: BigInt, [y1, y2]: BigInt): BigInt {
    return [x1 ^ y1, x2 ^ y2];
}

function bigOr([x1, x2]: BigInt, [y1, y2]: BigInt): BigInt {
    return [x1 | y1, x2 | y2];
}

function bigAdd([x1, x2]: BigInt, [y1, y2]: BigInt): BigInt {
    const lowsum = x1 + y1;
    const carry = low(lowsum) < rhs;
    return [low(lowsum), low(carry + x2 + y2)]
}

function bitNegate([x1, x2]: BigInt): BigInt {
    return [~x1, ~x2];
}

function isZero([x1, x2]: BigInt): boolean {
    return x1 == 0 && x2 == 0;
}

function bigShiftLeftOne([x1, x2] : BigInt) : BigInt {
    const carry: number = (x1 & (1 << 31)) > 0;
    return [(x1 << 1) | 0, x2 << 1 + carry];
}

function bigLT([x1, x2] : BigInt, [y1, y2]: BigInt): boolean {
    return x2 < y2 || (x2 == y2 && x1 < y1);
}

function bigEq([x1, x2] : BigInt, [y1, y2]: BigInt): boolean {
    return x1 == y1 && x2 == y2;
}

function repunit(n: number): BigInt {
    if (n < 32) {
        return [(1 << n) - 1, 0];
    } else {
        return [(1 << 31) - 1, (1 << (n - 31)) - 1];
    }
}

function LSB(x: BigInt): BigInt {
    return bigAnd(x, bigAdd(bitNegate(x), [1,0]));
    //return x & -x;
}

function MSB(x: BigInt): BigInt {
    /*let r = 1;
    while (x > 0) {
        r <<= 1;
        x <<= 1;
    }
    return r;*/
    let r:BigInt = [1,0];
    let y:BigInt = x;
    while (!isZero(x)) {
        r = bigShiftLeftOne(r);
        y = bigShiftLeftOne(y);
    }
    return r;
}

// if c is a number with n bits set,
// F is the next largest integer also with n
// bits set
function F(c: BigInt): BigInt {
    const a: BigInt = LSB(c);
    const b: BigInt = BigAdd(a,c);
    return BigOr(fromNum((getNum(bigXor(b,c)) / 4) / a), b);
}

function needCheck(a: number, b: number) {
    if (bigLT(a,b) || bigEq(a, b) || !bigEq(bigXor(a,b), bigOr(a,b))) {
        return false;
    } else if (bigLT(LSB(a), LSB(b)) != bigLT(MSB(a), MSB(b))) {
        return true;
    } else {
        return needCheck(bigAnd(a, bitNegate(LSB(a))), bigAnd(b, bitNegate(LSB(b)))) || needCheck(bigAnd(a, bitNegate(MSB(a))), bigAnd(b,bigNegate(LSB(b))));
    }
}

const N: number = 12;

let ans: number = 0;
for (let n: number = 2; n <= N / 2; ++n) {
    let a = (1 << n) - 1;
    for (let a: BigInt = repunit(n); a <= (1 << N); a = F(a)) {
        for (let b: number = (1 << n) - 1; b < (1 << N); b = F(b)) {
            if (needCheck(a, b)) {
                ans += 1;
            }
        }
    }
}
console.log(ans)
