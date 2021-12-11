Dim digits(1000) As Integer
Dim numdigits As Integer
Dim i As Integer
Dim carry As Integer
Dim j As Integer
Dim prod As Integer
Dim ans As Integer

i = 0
numdigits = 1
digits(0) = 2
WHILE i < 999
    carry = 0
    j = 0
    WHILE j < numdigits
        prod = (digits(j) * 2) + carry
        digits(j) = prod Mod 10
        carry = prod \ 10
        j = j + 1
    WEND
    
    WHILE carry > 0
        digits(numdigits) = carry Mod 10
        numdigits = numdigits + 1
        carry = carry \ 10
    WEND
    i = i + 1
WEND

i = 0
ans = 0
WHILE i < numdigits
    ans = ans + digits(i)
    i = i + 1
WEND

print ans
