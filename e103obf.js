function d(A) {
    var s = +[];
    for (var i = +[]; i < A.length; ++i) {
        s += A[i]
    }
    return s
}

function p(A) {
    var s = []
    var x = []
    var n = []
    for (var i = +[]; i < A.length; ++i) {
        x.push(+[]);
        n.push(+!+[]/+[])
    }
    for (var i = +[]; i < (+!+[] << A.length); ++i) {
        var a = u(i, A)
        var b = d(a)
        if (s.indexOf(b) < +[]) s.push(b)
        x[a.length] = Math.max(x[a.length], b)
        n[a.length] = Math.min(n[a.length], b)
    }
    return [s, x, n]
}

function u(s, l) {
    var a = []
    var k = +[]
    while (s != +[]) {
        if ((s & +!+[]) == +!+[]) a.push(l[k])
        k += +!+[]
        s >>= +!+[]
    }
    return a
}

function h(s) {
    var a = p(s.slice(+[], s.length - +!+[]))
    var b = a[+[]]
    var c = a[+!+[]]
    var e = a[!+[]+!+[]]
    for (var i = +[]; i < c.length; ++i) {
        if (e[i] <= s[s.length - !+[]] + c[i - (!+[]+!+[])]) {
            return ![]
        }
    }
    for (var i = +[]; i < b.length; ++i) {
        if (b.indexOf(b[i] + s[s.length - !+[]]) >= +[]) {
            return ![]
        }
    }
    return !![]
}

// Returns the optimal set of size K, subject to compatibility with rest
var m = 117
function o(k, r) {
    if (k == +[]) return r
    var n = (r.length > +[] ? (r[r.length - !+[]] + !+[]) : +!+[])
    var e = []
    while (m > d(r) + k * n) {
        var s = r.slice(+[], r.length)
        s.push(n)
        if (h(s)) {
            var t = o(k - !+[], s)
            if (t.length > +[] && d(t) <= m) {
                m = d(t)
                e = t
            }
        }
        n += !+[]
    }
    return e
}
console.log(o(6, []).join(""));
