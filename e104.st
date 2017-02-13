Object subclass: Fib [
]

Fib class extend [
    new [
        | r |
        r := super new.
        r init.
        ^r
    ]
]

Fib extend [
    init [
    ]

    e104 [
        | f1 f2 tail head |
        f1 := 1.
        f2 := 1.
        tail := Set new.
        head := Set new.
        3 to: 10000000 do: [:n |
            | f |
            f := f1 + f2.
            f1 := f2.
            f2 := f.
            (f > 1000000000000000000) ifTrue: [
                "get set of first digits, if size of set is 9 and no zeroes, is pan"
                tail empty.
                ((f \\ 1000000000) asString) do: [:i |
                     (i == $0) ifFalse: [ tail add: i ]
                ].
                    
                (tail size == 9) ifTrue: [
                    | headNum |
                    head empty.
                    "smalltalk gc sucks and stringification is slow, so chop off digits"
                    "through exponentiation and division first "
                    "(but a bit conservatively for rounding reasons)"
                    headNum := (f // (10 raisedTo: ((f estimatedLog) - 11))) asString.
                    (headNum size >= 9) ifTrue: [
                        (headNum copyFrom: 1 to: 9) do: [:i | 
                            (i == $0) ifFalse: [ head add: i ] 
                        ].
                    ].
                    (head size == 9) ifTrue: [ ^n ]
                ]
            ]
        ]
    ]
]

fib := Fib new.

(fib e104) printNl

