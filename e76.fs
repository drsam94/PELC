create count 101 101 * cells allot
: splitIndex { x } x 101 mod x 101 / ;
: makeIndex { i j } 101 j * i + ;
: test1 { i j } i 1 = j 1 = or ;
: test0 { i j } i 0 = j 0 = or ;
: testbig { i j } j i >= ;
: setArray { index value } value count index cells + ! ;
: getArray { index } count index cells + @ ;
: computeAns { i j } i j - j makeIndex getArray i j 1 - makeIndex getArray +  ;
: main 0 begin  
dup splitIndex test1 if dup 1 setArray else 
dup splitIndex test0 if dup 0 setArray else
dup splitIndex testbig if dup dup splitIndex drop dup 1 - makeIndex getArray 1 + setArray else
dup dup splitIndex computeAns setArray then then then 
1 + dup 101 101 * = until 
100 99 makeIndex getArray CR . CR bye ;
main
