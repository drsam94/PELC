defmodule E55 do
    def lrev(lst) when length(lst) == 0 do
        []
    end

    def lrev(lst) do
        lrev(tl(lst)) ++ [hd(lst)]
    end

    def numrev(x) do
        numrevHelper(x, 0)
    end

    def numrevHelper(0, r) do
        r
    end

    def numrevHelper(x, r) do
        numrevHelper(div(x,10), r*10 + rem(x,10))
    end

    def digits(x) when x == 0 do
        []
    end

    def digits(x) do
        digits(div(x, 10)) ++ [rem(x, 10)]
    end

    def isNumPalindrome(x) do
        isListPalindrome(digits(x))
    end

    def isListPalindrome(lst) when length(lst) < 2 do
        true
    end

    def isListPalindrome(lst) do
        isListPalindromeHelper(lst, lrev(lst), div(length(lst), 2), 0)
    end

    def isListPalindromeHelper(lst, tsl, target, k) when k >= target do
        true
    end
    
    def isListPalindromeHelper(lst, tsl, target, k) do
        if hd(lst) == hd(tsl) do
            isListPalindromeHelper(tl(lst),tl(tsl),target,k+1)
        else
            false
        end
    end

    def isLycherel(x) do
        isLycherelHelper(x, 0)
    end

    def isLycherelHelper(x, i) when i >= 50 do
        true
    end

    def isLycherelHelper(x, i) do
        y = x + numrev(x)
        if isNumPalindrome(y) do
            false
        else
            isLycherelHelper(y, i+1)
        end
    end

    def ans() do
        ansHelper(0, 1)
    end

    def ansHelper(acc, i) when i >= 10000 do
        acc
    end

    def ansHelper(acc, i) do
        if isLycherel(i) do
            ansHelper(1+acc,1+i)
        else
            ansHelper(acc,1+i)
        end
    end
end 
