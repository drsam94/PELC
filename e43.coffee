
concatDigits = (digits) ->
    sum = 0
    for i in digits
        do(i) ->
            sum = sum*10 + i
    return sum


hasProperty = (digits) ->
    if (concatDigits(digits[1..3]) % 2 is 0 and 
       concatDigits(digits[2..4]) % 3 is 0 and
       concatDigits(digits[3..5]) % 5 is 0 and
       concatDigits(digits[4..6]) % 7 is 0 and
       concatDigits(digits[5..7]) % 11 is 0 and
       concatDigits(digits[6..8]) % 13 is 0 and
       concatDigits(digits[7..])  % 17 is 0)
        concatDigits(digits)
    else
        0
    
fac = (x) => if x < 2 then 1 else x * fac(x - 1)
NthLP = (N, p, rem) ->
    if rem.length == 1 then return p.concat(rem)
    k = fac(rem.length - 1)
    index = Math.floor(N / k)
    p.push(rem[index])
    rem = if index is 0
            rem[1..]
          else if index is rem.length - 1
            rem[..-2]
          else 
            rem[..index-1].concat(rem[index+1..])
    return NthLP(N % k, p, rem)

sum = 0
i = 0
while i < fac(10)
    digits = NthLP(i, [], j for j in [0..9])
    sum += hasProperty(digits)
    i += 1
console.log(sum)
