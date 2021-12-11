
class Ring {
    Int[] elems
    
    static Int fac(Int x) {
        if (x < 2) {
            return 1
        } else {
            return x * fac(x-1)
        }
    }

    Int[] NthLP(Int N, Int[] p, Int[] rem) {
        if (rem.size == 1) {
            p.addAll(rem)
            return p
        }
        Int k := fac(rem.size - 1)
        Int timesDivided := N / k
        p.add(rem[timesDivided])
        rem.removeAt(timesDivided)
        return NthLP(N % k, p, rem) 
    }   
    
    Bool isMagic() {
        Int target := elems[4] + elems[9] + elems[5]
        for (i := 0; i < 4; ++i) {
            if (elems[i] + elems[5+i] + elems[6+i] != target) {
                return false
            }
        }
        return true
    }
    Str description() {
        Int minIndex := 0
        Str desc := ""
        5.times |i| { if (elems[i] < elems[minIndex]) { minIndex = i } }
        5.times |i| { 
            Int j := (i + minIndex) % 5
            [elems[j], elems[5+j], elems[(j == 4 ? 5 : 6 + j)]].each |d| { desc += "$d" }
        }
        return desc
    }
    new make(Int N) {
        //construct a Ring with elements
        //in the formation of the Nth Lexicographic permutation
        this.elems = NthLP(N, [,], [10,1,2,3,4,5,6,7,8,9])
    }
}

class E68 {

    static Void main() {
        Str maxstr := ""
        for (i := 0; i < Ring.fac(10); ++i) {
            Ring r := Ring(i)
            Str s := ""
            if (r.isMagic()) {
                s = r.description()
                if (s.size() > 16) {
                    break
                } else if (s.compare(maxstr) > 0) {
                    maxstr = s
                }
            }
        }
        echo(maxstr)
    }
}
        
