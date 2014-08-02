
def divisorsum(x)
    ret = 1
    (2..x).each {|i|
        if (i * i > x)
            break
        end
        if (x % i == 0)
            ret += i + (x / i)
        end
    }
    return ret
end

amChainLength = Array.new(size = 1000001, obj = 0)
maxCLength = 0
ans = 0
(4..1000000).each {|i|
    chain = [i]
    nextElem = i
    while (nextElem < 1000000 and amChainLength[nextElem] == 0)
        nextElem = divisorsum(nextElem)
        if (chain.include? nextElem)
            atIndex = chain.index(nextElem)
            (0..(atIndex - 1)).each{ |ind|
                amChainLength[chain[ind]] = 1
            }
            subl = chain.length - atIndex
            minElem = nextElem
            (atIndex..(chain.length - 1)).each{ |ind|
                amChainLength[chain[ind]] = 1
                minElem = [minElem, chain[ind]].min
            }
            if (subl > maxCLength)
                maxCLength = subl
                ans = minElem
            end
        elsif (nextElem > 1000000)
            chain.each {|elem| amChainLength[elem] = 1}
        end
      
        chain <<= nextElem
    end
    # If we hit something that made us end prematurely:
    if (amChainLength[i] == 0)
        chain.each {|elem| amChainLength[elem] = 1}
    end
}
printf("%d\n", ans)


