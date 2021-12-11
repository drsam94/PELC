-module(e24).
-on_load(e24/0).

fac(0) -> 1;
fac(N) -> N * fac(N - 1).


list_ref(0, [Head|_]) -> Head;
list_ref(X, [_|Tail]) -> list_ref(X - 1, Tail).

nthLP(N, P, Rem) ->
    if
        length(Rem) == 1 ->
            P ++ Rem;
        true ->
            K    = fac(9 - length(P)),
            Elem = list_ref(trunc(N / K), Rem),
            
            nthLP(N rem  K, P ++ [Elem], Rem -- [Elem])
    end.
e24() -> io:format("~B~B~B~B~B~B~B~B~B~B~n", 
    nthLP(999999, [], [0,1,2,3,4,5,6,7,8,9])).
