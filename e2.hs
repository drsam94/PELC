
fibLst (a:b) = if (a + head(b)) < 4000000
               then a : fibLst(head(b) : ((a+head(b)) : (tail b)))
               else a : b

main = putStrLn( show (foldr (+) 0 (map (\x  -> if mod x 2 == 0 then x else 0) (fibLst([1,1]))) )) 
