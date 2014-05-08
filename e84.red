
lastrand: 8191
rand: func [ 
    return: [integer!] 
] [
    lastrand: ((lastrand * 6752) + 23) % 32767
    lastrand
]
 
squares: [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]

pos: 0
turn: 0
ccn: 0
chn: 0
while [turn < 1000000] [
    goagain: true
    dubcount: 0
    while [goagain] [
        d1: 1 + ((rand) % 4)
        d2: 1 + ((rand) % 4)
        either d1 = d2 [
            goagain: true
            dubcount: dubcount + 1
        ] [
            goagain: false
        ]
        either dubcount = 3 [
            pos: 11
            goagain: false
        ] [
            pos: ((pos + d1 + d2) % 40)
            switch pos [
                0 [pos: 40]
                31 [pos: 11
                    goagain: false]
                3 18 34 [
                    switch ccn [
                        0 [pos: 1]
                        1 [pos: 11
                           goagain: false]
                        2 3 4 5 6 7 8 9 10 11 12 13 14 15 [pos: pos]
                    ]
                    ccn: (ccn + 1) % 16
                ]
                8 23 37 [
                    switch chn [
                        0 [pos: 1]
                        1 [pos: 11
                           goagain: false]
                        2 [pos: 12]
                        3 [pos: 25]
                        4 [pos: 40]
                        5 [pos: 6]
                        6 7 [switch pos [
                                    8 [pos: 16]
                                    23 [pos: 26]
                                    37 [pos: 6]
                            ]]
                        8 [switch pos [
                                    8 37 [pos: 13]
                                    23 [pos: 29]
                            ]]
                        9 [pos: pos - 3]
                        10 11 12 13 14 15 [pos: pos]
                    ]
                    chn: (chn + 1) % 16
                ]
                1 2 4 5 6 7 9 10 11 12 13 14 15 16 17 19 20 [pos: pos]
                21 22 24 25 26 27 28 29 30 32 33 34 35 36 38 39 40 [pos: pos]
            ]
        ]
    ]
    squares/(pos + 0): squares/(pos + 0) + 1
    turn: turn + 1  
]
caps: [1000000 0 0 0]
ans: [0 0 0]
i: 1
while [i < 4][
    j: 1
    while [j < 41][
        if all [squares/(j + 0) < caps/(i + 0) squares/(j + 0) > caps/(i + 1)][
            caps/(i + 1): squares/(j + 0)
            ans/(i + 0): j - 1
        ]
        j: j + 1
    ]
    i: i + 1
]
print squares
print ans
