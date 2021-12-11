uses java.lang.*
    
var sols = { 0 -> 0 }

for (a in 2..500) {
    for (b in a..500) {
        var c2 = a*a + b*b
        var c  = Math.sqrt(c2) as int
        if (c2 == c * c) {
            var p = a + b + c
            if (p <= 1000) {
                if (!sols.containsKey(p)) {
                    sols.put( p, 1)
                } else {
                    sols.put( p, sols.get(p) + 1)
                }
            }
        }
    }
}

var ans = 0
var maxsols = 0
for (p in sols.keySet()) {
    if (maxsols < sols.get(p)) {
        ans = p
        maxsols = sols.get(p)
    }
}
print(ans)
     
