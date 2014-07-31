<?php
function fac($x) {
    return $x < 2 ? 1 : $x * fac($x - 1);
}

#Nth Lexicographic permutation fcn,
#taken from my solutions to many other
#problems
function NthLP($n, $p, $rem) {
    if (count($rem) == 1) {
        $p[] = $rem[0];
        return $p;
    }
    $k = fac(count($rem) - 1);
    $timesDivided = (int) ($n / $k);
    $p[] = $rem[$timesDivided];
    array_splice($rem,$timesDivided, 1);
    return NthLP($n % $k, $p, $rem);
}

function digits($num) {
    $ret = array();
    while ($num > 0) {
        $ret[] = ($num % 10);
        $num = (int) ($num / 10);
    }
    return array_reverse($ret);
}

#abstraction for calling operations by number
function op($x, $y, $op) {
    if (is_infinite($x) || is_infinite($y)) { 
        return INF; 
    }
    switch($op) {
    case 0:
        return $x * $y;
    case 1:
        return $x - $y;
    case 2:
        return $y == 0 ? INF : ($x / $y);
    case 3:
        return $x + $y;
    default:
        return 3025;
    }
}

#index encodes the permutation of digits,
#parenthization, and operands,
#as a sort of multi-base number
function getNum($dlist, $index) {
    $permut = $index % 24;
    $index  = (int) ($index / 24);
    $parenth= $index % 5;
    $index  = (int) ($index / 5);
    $op1    = $index % 4;
    $index  = (int) ($index / 4);
    $op2    = $index % 4;
    $index  = (int) ($index / 4);
    $op3    = $index % 4;
    $d      = NthLP($permut, array(), $dlist);
    switch($parenth) {
    case 0:
        return op( op( $d[0], $d[1], $op1), op($d[2], $d[3], $op3), $op2);
    case 1:
        return op( $d[0], op($d[1], op($d[2], $d[3], $op3), $op2), $op1);
    case 2:
        return op( $d[0], op( op($d[1], $d[2], $op2), $d[3], $op3), $op1);
    case 3:
        return op( op( $d[0], op( $d[1], $d[2], $op2), $op1), $d[3], $op3);
    case 4:
        return op( op( op( $d[0], $d[1], $op1), $d[2], $op2), $d[3], $op3);
    default:
        return 3025;
    }
}

#So apparently PHP passes arrays by value
#scary
function setBit($lst, $n) {
    #test for integer-ness
    if (($n - (int)$n) < 0.01) {
        $n = (int) $n;
        $lst[(int) ($n / 32)] |= 1 << ($n % 32);
    }
    return $lst;
}

function countConsec($lst) {
    $count = 0;
    for ($k = 1; $k < 3024; $k++) {
        if ((($lst[(int) ($k / 32)] >> ($k % 32)) & 1) == 1) {
            $count += 1;
        } else {
            return $count;
        }
    }
    return $count;
}

function numConsec($x) {
    $digs = digits($x);
    if (!((count($digs) == 4) && ($digs[0] < $digs[1]) &&
        ($digs[1] < $digs[2]) && ($digs[2] < $digs[3]))) {
            return 0;
    }
    $results = array_fill(0, (int) (3024 / 32), 0);
    for ($i = 0; $i < (5 * 4 * 4 * 4 * 24); $i++) {
        $next = getNum($digs, $i);
        if ($next > 0 && $next < 3024) {
           $results = setBit($results, $next);
        }
    }
    return countConsec($results);
}

$soln = 1234;
$maxConsec = 0;
for($i = 1234; $i <= 6789; $i++) {
    $num = numConsec($i);
    if ($num > $maxConsec) {
        $maxConsec = $num;
        $soln = $i;
    }
}
var_dump($soln);
?>
