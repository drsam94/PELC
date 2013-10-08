
squareRootHelper n xn = let xn1 = div (xn + (div n xn)) 2 
                        in if or [xn == xn1, xn == xn1 +1] 
                             then min xn xn1 
                             else squareRootHelper n xn1
squareRoot x = squareRootHelper x (div x 2)

--isPrime method for making a list of primes
isPrime x lst = and(map (\n -> if n == 0 then False else True) (map (\n -> mod x n) lst))
--isPrime method for checking whether a number is prime after you already have a full list
primeCheck x lst = elem x lst

primes n  = if n <= 10 then [2,3,5,7] else 
                        let root = squareRoot n in
                        let lst = primes(root) 
                        in lst ++ (filter (\x -> isPrime x lst) (take (n - root) [root..])) 

--yes I probably should have implemented isTruncLeft/Right with currying and such...oh well
tright 0 = []
tright x = x : tright(div x 10)
isTruncRight p plst = and (map (\x -> primeCheck x plst) (tright p))

magnitude x = if x < 10 then 1
                        else 10 * (magnitude(div x 10))
tleft 0 = []
tleft x = x : tleft(mod x (magnitude x))
isTruncLeft p plst = and (map (\x -> primeCheck x plst) (tleft p))

main = let lst = primes 800000 in
       putStrLn( show (foldr (+) 0 (filter (\x -> and [isTruncRight x lst, isTruncLeft x lst]) (filter (\x -> x > 10) lst))))