
ans = 0;
clength = 0;
for (d = 999; d > clength; --d) {
    rems = list.new(0);
    r = 1;
    i = 0;
    while (r != 0) {
        r = (r * 10) % d;
        for (j = 0; j < i; ++j) {
            if (rems.get(j) == r) {
                r = 0;
                j = i;
            }
        }
        if (r != 0) {
            
            rems.append(r);
            i += 1;
        }
    }
    if (clength < i) {
        ans = d;
        clength = i;
    }
}

stdout.println(ans);
