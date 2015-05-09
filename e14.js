
function cc(n) {
    var c = 1;
    while (n != 1) {
        if (n % 2 == 0) n /= 2
        else n = 3*n+1
        ++c
    }
    return c
}

s = 0
a = 0
for (var i = 1; i < 1000000; ++i) {
    t = cc(i)
    if (t > s) {
        a = i
        s = t
    }
}
console.log(a)
