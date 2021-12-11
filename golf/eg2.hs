f (a:b:c)=if a+b<4000000 then a:f(b:(a+b:c)) else a:b:c
main=putStrLn$show$foldr(+)0$map(\x->x*(mod x 2))$f [1,1]
