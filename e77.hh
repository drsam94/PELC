<?hh

function isPrime(int $x): int {
    if ($x < 2) {
        return false;
    } else if ($x % 2 == 0) {
        return $x == 2;
    }

    for ($i = 3; $i*$i <= $x; $i+=2) {
        if ($x % $i == 0) {
            return false;
        }
    }
    return true;
}

$count = Vector<Vector<int>>{ } ;
$BOUND = 1000;

for ($i = 0; $i < $BOUND; $i++) {
    $count[] = Vector<int>{};
    for ($j = 0; $j < $BOUND; $j++) {
        $count[$i][] = 0;
    }
}

for ($i = 0; $i < $BOUND; $i++) {
    for ($j = 0; $j < $BOUND; $j++) {
        if ($i == 2 or ($j == 2 and $i % 2 == 0)) {
            $count[$i][$j] = 1;
        } else if ($i < 2 or $j < 2) {
            $count[$i][$j] = 0;
        } else if ($j >= $i) {
            $count[$i][$j] = $count[$i][$i-1];
            if (isPrime($i)) {
                $count[$i][$j] += 1;
            }
        } else if (isPrime($j)) {
            $count[$i][$j] = $count[$i - $j][$j] + $count[$i][$j - 1];
            if ($count[$i][$j] > 5000) {
                echo $i . "\n";
                $i = $BOUND;
                $j = $BOUND;
            }
        } else {
            $count[$i][$j] = $count[$i][$j - 1];
        }
    }
}

