
myBlock := [ :a :b |
                 m := x + a.
                 y := a * y.
                 z := x + m.
                 a - x
               ]

| u |
u := myBlock value: 5 value: 7
