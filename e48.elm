ans a i =
  if i > 1000 then a
  else (ans (mod ((subans i 1 i) + a) 10000000000) (i + 1))

subans a j i =
  if j == i then a
  else (subans (mod  (a * i) 10000000000) (j + 1) i)
  
main = asText (ans 0 1)