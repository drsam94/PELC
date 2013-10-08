my $day = 1;
my $sundays = 0;
for my $y (0..100){
    for my $mo (0..11){
        print "$day ";
        if ($day == 0 && $y != 0) {
            $sundays += 1;
        }
        if ($mo == 0 || $mo == 2 || $mo == 4 || $mo == 6 || $mo == 7 || $mo == 9 || $mo == 11) {
            $day = ($day + 3) % 7;
        } elsif ($mo == 1) {
          if ($y % 4 == 0 && $y != 0) {
            $day = ($day + 1) % 7;
          }
        } else {
          $day = ($day + 2) % 7;
        }
    }
    print "\n"
}
print "Number of Sundays is $sundays\n";
