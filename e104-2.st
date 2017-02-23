
Object subclass: Fib [
    | memo |
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
    get: n [
        ((memo at: n) == nil) ifTrue: [ ^((self get: (n - 1)) + (self get: (n - 2))) ].
        ^(memo at: n)
    ]

    init [
        memo := Array new: 100000.
        memo at: 1 put: 1.
        memo at: 2 put: 1
    ]

    e104 [
        1 to: (memo size) do: [:n |
            | f head |
            f := self get: n.
            head := Set new.
            ^5
        ]
    ]
]

fib := Fib new.

(fib e104) printNl

