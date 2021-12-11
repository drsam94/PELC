
log-10: func [x] [return (log-e x) / (log-e 10)]

ans: 0
j: 1
b: 1
while [b < 10] [
    i: b
    while [i < 10] [
        digs: 1 + (to integer! (j * log-10 (i)))
        either digs = j [
            ans: ans + 1
        ] [
            b: i + 1
        ]
        i: i + 1
    ]
    j: j + 1
]
print ans
                
