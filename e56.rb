
def digisum(x)
    ret = 0
    (1..(x.to_s.length)).each {|i|
        ret += (x % (10 ** i)) / (10 ** (i - 1)) }
    return ret
end

ans = 0
(1..99).each {|a|
    (1..99).each {|b|
        dsum = digisum(a ** b)
        ans = dsum > ans ? dsum : ans
    }
}
printf("%d\n",ans)

