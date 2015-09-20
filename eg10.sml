open Math
fun h[]=false|h(x::y)=(x=true)orelse h y;
fun a p l=not(h(map (fn n=>0=p mod n)l));
fun r(N,p,l,x)=if p=N then l@rev(x)else if a p l then r(N,p+1,l,p::x)else r(N,p+1,l,x);
fun p n=if n<=10 then[2,3,5,7]else r(n,10,p(ceil(Math.sqrt(real n))),[]);
fun s[]=Int.toLarge 0|s(x::y)=Int.toLarge x+s y;
s(p 2000000)
