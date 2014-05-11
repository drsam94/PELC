tri : Int -> Int

tri n = divInt (n * (n + 1)) 2

rectangles : Int -> Int -> Int

rectangles n 0 = 0
rectangles n k = ((tri n) * k) + (rectangles n (k - 1))

N : Int
N = 2000000
findans : Int -> Int -> Int -> Int -> Int

findans 1000 h optarea optcount = optarea
findans w 1000 optarea optcount = findans (w + 1) 1 optarea optcount
findans w h optarea optcount = 
    let numrects = rectangles w h in
        if (abs (N - numrects)) < (abs (N - optcount)) then
            findans w h (w * h) numrects else
            if numrects > N then
                findans (w + 1) 1 optarea optcount else
                findans w (h + 1) optarea optcount
main : IO ()
main = putStrLn (show (findans 1 1 0 0))
