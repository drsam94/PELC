
let rec answer day sundays mo y =
    if y = 101  then sundays else
    if mo = 12  then (answer day sundays 0 (y + 1)) else
        let newsun = (if (day = 0) && not (y = 0) then sundays + 1 else sundays)
        if (mo = 0 || mo = 2 || mo = 4 || mo = 6 || mo = 7 || mo = 9 || mo = 11) then
            (answer ((day + 3) % 7) newsun (mo + 1) y) else
        if (mo = 1) then
            (answer (if ((y % 4 = 0) && not (y = 0)) then ((day + 1) % 7) else day) newsun (mo + 1) y)
        else
            (answer ((day + 2) % 7) newsun (mo + 1) y)

printfn "%d" (answer 1 0 0 0)
