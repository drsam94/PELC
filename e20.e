
var d := [1]
def digits := d.diverge()


for x in 2..100 {
    var carry := 0
    for i in 0..(digits.size()-1) {
        var prod := (digits[i] * x) + carry
        digits[i] := prod % 10
        carry := prod // 10
    }
    while (carry > 0) {
        digits.push( carry % 10)
        carry := carry // 10
    }
}

var digisum := 0

for d in digits {
    digisum += d
}

println(digisum)

