open TextIO
open String

val ins = TextIO.openIn "words.txt";
fun getLines s =
  case (TextIO.inputLine s) of
       SOME line => line :: (getLines s) 
     | NONE      => [];
 
fun wv (c :: cs) = if c = #"\n" then 0 
                   else ord(c) - 64 + wv(cs)
  | wv nil = 0;

 
fun wordVal s = wv(explode s);
 
(* The String package overrides map...so here is a map function *)
fun map f (x ::xs) = (f x) :: (map f xs)
  | map f nil      = nil;

fun tri n = n * (n + 1) div 2

fun contains(y, (x::xs)) = if y = x then 1 else contains(y,xs)
  | contains(y, nil)     = 0

val tris = map tri [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, 17, 18, 19, 20];
foldr op+ 0 (map (fn x => contains(wordVal x, tris)) (getLines ins));

