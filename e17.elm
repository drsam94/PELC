sinDigLetters n =
    if n == 1 then (length "one")
    else if n == 2 then (length "two")
    else if n == 3 then (length "three")
    else if n == 4 then (length "four")
    else if n == 5 then (length "five")
    else if n == 6 then (length "six")
    else if n == 7 then (length "seven")
    else if n == 8 then (length "eight")
    else if n == 9 then (length "nine")
    else 0

simDubDig n =
  if n == 2 then (length "twenty")
  else if n == 3 then (length "thirty")
  else if n == 4 then (length "forty")
  else if n == 5 then (length "fifty")
  else if n == 6 then (length "sixty")
  else if n == 7 then (length "seventy")
  else if n == 8 then (length "eighty")
  else if n == 9 then (length "ninety")
  else 0
  
dubDigLetters n = 
    if n <= 19 then (if n >= 10 then
      (if n == 10 then (length "ten")
      else if n == 11 then (length "eleven")
      else if n == 12 then (length "twelve")
      else if n == 13 then (length "thirteen")
      else if n == 14 then (length "fourteen")
      else if n == 15 then (length "fifteen")
      else if n == 16 then (length "sixteen")
      else if n == 17 then (length "seventeen")
      else if n == 18 then (length "eighteen")
      else if n == 19 then (length "nineteen")
      else 0) else (sinDigLetters(n)) )
    else (simDubDig(div n 10)) + (sinDigLetters(mod n 10))
    
letters n =
    if n == 1000 then (length "onethousand") 
    else (if n > 99 then (length "hundred") + (if (mod n 100) > 0 then (length "and") else 0) else 0) + (sinDigLetters (div n 100)) + (dubDigLetters(mod n 100)) 
                                                  
main = asText( (foldr (+) 0 (map (letters) [1..1000])))
