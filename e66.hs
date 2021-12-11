import Data.List
import Data.FixedPoint
import Debug.Trace
-- Replace Double with Rational or with FixedPoint
cfr :: FixedPoint256256 -> (Int -> Int128)

cfr = repindex . cfr_helper

repindex :: ([Int128], Int) -> Int -> Int128

repindex (coeffs, rep) index
    | index < (length coeffs) = coeffs !! index
    | otherwise = coeffs !! (rep + ((index - (rep)) `mod` ((length coeffs) - rep)))

cfr_helper :: FixedPoint256256 -> ([Int128], Int)

cfr_helper alpha = let a0 = floor alpha in
                     let alpha1 = alpha - (fromIntegral a0) in
                       cfr_rec alpha1 [a0, floor (1.0/alpha1)] [alpha1]

cfr_rec :: FixedPoint256256 -> [Int128] -> [FixedPoint256256] -> ([Int128], Int)

gauss_map :: FixedPoint256256 -> FixedPoint256256

gauss_map alpha = (1.0 / alpha) - (fromIntegral (floor(1.0 / alpha)))

fuzzyIndex :: FixedPoint256256 -> [FixedPoint256256] -> Maybe Int

fuzzyIndex _ [] = Nothing
fuzzyIndex x (y:ys)
    | abs(x - y) < 1e-5 = Just 0
    | otherwise = case (fuzzyIndex x ys) of
        Just i  -> Just (i + 1)
        Nothing -> Nothing

cfr_rec alpha0 as alphas = let alpha1 = gauss_map(alpha0) in
    case fuzzyIndex alpha1 alphas of
        Just i  -> (as,i+1)
        Nothing -> cfr_rec alpha1 (as ++ [floor(1.0 / alpha1)]) (alphas ++ [alpha1])

min_soln :: Int -> (Int128,Int)
min_soln d = let coeffs = ((cfr . sqrt' . fromIntegral) d) in
        min_soln_rec d (coeffs) (coeffs 0) 1 1 0 1

min_soln_rec :: Int -> (Int -> Int128) -> Int128 -> Int128 -> Int128 -> Int128 -> Int -> (Int128,Int)

min_soln_rec d coeffs p1 q1 p0 q0 n = let an = coeffs n in
    let (pn,qn) = (p1 * an + p0, q1 * an + q0) in
        if (pn^2 - (fromIntegral d)*qn^2) == 1 then (pn,d)
        else min_soln_rec d coeffs pn qn p1 q1 (n+1)

maxSoln :: (Int128,Int) -> (Int128,Int) -> (Int128,Int)
maxSoln (x1,d1) (x2,d2)
    | x1 > x2 = (x1,d1)
    | otherwise = (x2,d2)

ans :: Int -> Int

isNotSquare :: Int -> Bool

isNotSquare x = let xx = fromIntegral x in (floor (sqrt xx))^2 /= (floor xx)

ans b = snd . foldr maxSoln (0,0) $ map min_soln $ filter isNotSquare [1..b]

main = putStrLn $ show $ ans 1000
