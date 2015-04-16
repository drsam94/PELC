
type Point = { x : float; y : float}

let mutable ans = 0
let mutable c = 0

let ell (A : Point) (B : Point) x = (B.y - A.y) / (B.x - A.x) * (x - A.x) + A.y

let isValid (points : Point[]) i =
    let A = points.[(i + 1) % 3] in
    let B = points.[(i + 2) % 3] in
    let f = ell A B in
    let p = points.[i] in
    if (A.x = B.x) then
        (p.x > A.x) = (0.0 > A.x)
    else
        (p.y - (f p.x)) * (- (f 0.0)) > 0.0

for line in System.IO.File.ReadLines("triangles.txt") do
  let rawpoints = Array.map (fun s -> System.Double.Parse(s)) (line.Split(','))
  let points = Array.map (fun i -> { x = rawpoints.[i*2]; y = rawpoints.[i*2 + 1] } : Point ) [|0 .. 2|]

  ans <- ans + (if (Array.fold (fun b i  -> b && isValid points i) true [| 0 .. 2 |]) then 1 else 0)


printfn "%d" ans
