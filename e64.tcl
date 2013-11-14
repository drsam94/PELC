proc nextTerm {N m b} {
    set d [expr {$N - ($b ** 2)}]
    set d [expr {int($d/ $m)}]
    set k [expr {ceil((2 * $b) / $d)}]
    set bp [expr {($k * $d) - $b}]
    if [expr {$bp ** 2 > $N}] {
        set k [expr {$k-1}]
        set bp [expr {($k * $d) - $b}]
    }
    return [list $d $bp]
}

proc mag {x} {
    if [expr {$x < 10}] {
        return 100
    } else {
        set b [expr {$x / 10}]
        set g [mag $b]
        return [expr {10 * $g}]
    }
}

set ans 0
for {set N 2} {$N <= 10000 } {incr N} {
    set a0 [expr {int(sqrt($N))}]
    if [expr {!($a0 * $a0 == $N)}] {
        set done -1
        set b $a0
        set m 1
        set coeffs {}
        while {$done == -1} {
            set data [nextTerm $N $m $b]
            set m    [lindex $data 0]
            set b    [lindex $data 1]
            set mg   [mag $b]
            set v    [expr {($m * $mg) + $b}]
            set done [lsearch $coeffs $v]
            if [expr {$done == -1 }] {
                lappend coeffs $v
            }
        }
        set l [llength $coeffs]
        if [expr {$l % 2 == 1}] {
            incr ans
        }
    }
}
puts $ans
