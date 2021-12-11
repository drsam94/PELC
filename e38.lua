function oom (x)
    if x < 10 then return 0
    else return 1 + oom (x / 10) 
    end
end

function getDigits(x)
    a = {}
    cap = oom(x) + 1  
    for n = 1, cap do
        a[n] = x % 10
        x = math.floor (x / 10)
    end
    return a
end

function isPandigital (x)
    digits = getDigits(x)
    table.sort(digits)
    for i = 1, #digits do
        if digits[i] ~= i then return false end
    end
    return true
end

--returns the largest pandigital number
--formed by concatenating x * (1,2,..n)
--for some n - if no such num exists,
--returns 0
function pandigVal (x)
    i = 1
    pan = 0
    while oom(pan) < 8 do
        num = i * x
        pan = pan * (10 ^ (oom(num) + 1)) + num
        i = i + 1
    end
    if not isPandigital(pan) then return 0
    else return pan
    end
end

max = 0
j = 1
while j < 10000 do
    max = math.max(max, pandigVal(j))
    j = j + 1
end
print(max)
