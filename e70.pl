
sub isPrime {
    my (@ops) = @_;
    my $x = $ops[0];
    if ($x < 2 || $x % 2 == 0) {
        return x == 2
    }
    for (my $i = 3; $i * $i <= $x; $i += 2) {
        if ($x % $i == 0) {
            return 0
        }
    }
    return 1
}

sub nextPrime {
    my (@ops) = @_;
    my $x = $ops[0];
    my $y = $x + 1;
    while (not(isPrime($y))) {
        $y += 1;
    }
    return $y;
}

sub lstprod {
    my (@ops) = @_;
    my $r = 1;
    for my $x (@ops) {
        $r *= $x;
    }
    return $r
}

sub totientIsPermut {
    my (@ops) = @_;
    my $n = lstprod(@ops);
    my $prev = 0;
    my $t = $n;
    #print "-$n, @ops\n";
    for my $p (@ops) {
        if ($p != $prev) {
            $t = $t / $p;
            $t = ($p - 1) * $t;
            $prev = $p
        }
    }
    my @tarr = sort split('', "$t");
    my @narr = sort split('', "$n");
    my $ts   = join('',@tarr);
    my $ns   = join('',@narr);
    if ($ts eq $ns) {
        $rat = $n / $t;
    }
    return ($ts eq $ns) 
}

sub update {
    my (@ops) = @_;
    my $size = @ops;
    for (my $x = 0; $x < $size; $x += 1) {
        my $next = nextPrime($ops[$x]);
        my @slice = @ops[($x+1).. ($size-1)];
        my $nprod = $next * lstprod(@slice);
        if ($nprod < 10000000 && $nprod != 0) {
            @slice = @ops[($x) .. ($size-1)];
            $slice[$x] = $next;
            return @slice
        }
    }
    @slice = @ops[1 .. ($size-1)];
    return update(@slice)
}
my @nums = (2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2);
my $done = 0;
my $minrat = 2;
$rat = 2;
my $ans  = 0;
while (not($done)) {
    if (totientIsPermut(@nums)) {
        if ($rat < $minrat) {
            $minrat = $rat;
            $n = lstprod(@nums);
            if ($n > 10000000) {
                $done = 1
            } else {
                $ans = lstprod(@nums)
            }
        }
    }
    @nums = update(@nums)
}
print "$ans\n"

