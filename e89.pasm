.loadlib 'io_ops'

#ASCII values of important letters
.macro_const M 77
.macro_const D 68
.macro_const C 67
.macro_const L 76
.macro_const X 88
.macro_const V 86
.macro_const I 73

#Impromptu convention:
#arguments passed in I/S 1, returned in I/S 0
.pcc_sub :main main:
    #'The Stack'
    new         P10,'ResizableIntegerArray'
    getstdin    P0
    set         I9, 0
MAINLOOP:
    readline    S1, P0
    unless      S1, FINAL
    #get length of string
    length      I8, S1
    #subtract 2 from length because windows newline
    sub         I8, I8, 2
    inc         I8
    #cutoff one char of newline, as methods expect
    #UNIX newlines
    substr      S1, S1, 0, I8
    dec         I8
    #Now that that is done...
    local_branch P10, GET_STRING_VALUE
    local_branch P10, GET_CHAR_COUNT
    sub         I0, I8, I0
    add         I9, I9, I0 
    branch      MAINLOOP
FINAL:
    say         I9
    end

#Basically a switch statement
#input: I0
#output: I0
GET_CHAR_VALUE:
    eq          I0, .M, M
    eq          I0, .D, D
    eq          I0, .C, C
    eq          I0, .L, L
    eq          I0, .X, X
    eq          I0, .V, V
I:
    set         I0, 1
    local_return P10
V:  
    set         I0, 5
    local_return P10
X:  
    set         I0, 10
    local_return P10
L:  
    set         I0, 50
     local_return P10
C:  
    set         I0, 100
    local_return P10
D:  
    set         I0, 500
    local_return P10
M:  
    set         I0, 1000
    local_return P10

#compute integer corresponding to Roman Numeral
#input: S1
#output: I0
#used: I2, I3, I4, I5, S2
GET_STRING_VALUE:
    length      I2, S1
    dec         I2
    set         I3, 0
    set         I4, 0
    set         I5, 0
LOOP:
    ge          I3, I2, ENDLOOP
    substr      S2, S1, I3, 1 
    ord         I0, S2
    local_branch P10, GET_CHAR_VALUE
    set         I4, I0
    inc         I3
    substr      S2, S1, I3, 1
    ord         I0, S2
    local_branch P10, GET_CHAR_VALUE
    lt          I4, I0, _SUB
    add         I5, I5, I4
    branch      LOOP
_SUB:
    sub         I5, I5, I4
    branch      LOOP    
ENDLOOP:
    set         I0, I5
    local_return P10

#This could be written much more nicely
#If I could figure out how to do arrays
#input: I0
#used: I1, I6, I7
GET_CHAR_COUNT:
    #Move input into I1
    #And compute number of M's
    set         I1, I0
    div         I6, I1, 1000
    mul         I0, I6, 1000
    sub         I1, I1, I0
    set         I7, I6
    #CM
    div         I6, I1, 900
    mul         I0, I6, 900
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #D
    div         I6, I1, 500
    mul         I0, I6, 500
    sub         I1, I1, I0
    add         I7, I7, I6
    #CD
    div         I6, I1, 400
    mul         I0, I6, 400
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #C
    div         I6, I1, 100
    mul         I0, I6, 100
    sub         I1, I1, I0
    add         I7, I7, I6
    #XC
    div         I6, I1, 90
    mul         I0, I6, 90
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #L
    div         I6, I1, 50
    mul         I0, I6, 50
    sub         I1, I1, I0
    add         I7, I7, I6
    #XL
    div         I6, I1, 40
    mul         I0, I6, 40
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #X
    div         I6, I1, 10
    mul         I0, I6, 10
    sub         I1, I1, I0
    add         I7, I7, I6
    #IX
    div         I6, I1, 9
    mul         I0, I6, 9
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #V
    div         I6, I1, 5
    mul         I0, I6, 5
    sub         I1, I1, I0
    add         I7, I7, I6
    #IV
    div         I6, I1, 4
    mul         I0, I6, 4
    sub         I1, I1, I0
    mul         I6, I6, 2
    add         I7, I7, I6
    #I
    add         I0, I7, I1
    local_return P10 
