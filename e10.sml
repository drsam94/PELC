Control.Print.printLength := 1000;
open Math



fun hasTrue nil = false
  | hasTrue (x::xs) = (x = true) orelse hasTrue(xs);

fun isPrime(p,lst) = not(hasTrue(map (fn n => 0 = p mod n) lst));

fun pprimes(N,p,lst,xtras)=
        if p  = N then lst @ rev(xtras)
        else if isPrime(p, lst) then pprimes(N,p+1,lst,p::xtras) else
          pprimes(N,p+1,lst, xtras)

fun primes n = if n <= 10 then [2,3,5,7] else
  pprimes(n,10,primes(ceil(Math.sqrt(real(n)))),[]);

(* Integer overflow occurs in the sum unless we account for it *) 
fun listsum nil   = Int.toLarge(0)
  | listsum(x::xs) = Int.toLarge(x) + listsum(xs);

fun printlst nil = (print "\n"; 0)
  |   printlst (x::xs) = (print (Int.toString(x)); print "\n"; printlst(xs));

listsum(primes(2000000))

