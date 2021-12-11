
fn exp(b: int, e: int) -> int {
    if e == 0 {
        1
    } else {
        b * exp(b, e - 1)
    }
}

fn getDigit(x: int, n: int, k: int) -> int  {
    if n == k - 1 {
        x % 10
    } else {
        getDigit(x / 10, n, k - 1)
    }
}

/**The minimum n such that d_n indexes into a k-digit number*/
fn min_n(k: int) -> int {
    let mut i = 1;
    let mut sum = 0;
    while i < k {
      sum += i * exp(10, i -1);
      i += 1;
    }
    1 + (9 * sum)
}

fn d_n(n: int) -> int {
    let mut min = 1;
    let mut k = 1;
    while min_n(k) <= n {
        min = min_n(k);
        k += 1
    }
    k -= 1;
    let numIndex  = (n - min) / k;
    let digiIndex = (n - min) % k;
    getDigit(exp(10, k - 1) + numIndex, digiIndex, k)
}
fn main() {
    let mut prod = 1;
    let mut n = 1;
    while n <= 1000000 {
        prod *= d_n(n);
        n    *= 10;
    }
    println(fmt!("%d", prod));
}
