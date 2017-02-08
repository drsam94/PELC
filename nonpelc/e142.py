"""
A bunch of equations that explain my reasoning
x + y = a^2
x + z = b^2
y + z = c^2
x - y = d^2
x - z = e^2
y - z = f^2

x + y = b^2 + f^2 = a^2
x + y = c^2 + e^2 = a^2
2y = c^2 + f^2
2x = b^2 + e^2
2x = a^2 + d^2
x + z = c^2 + d^2 = b^2
x - z = d^2 + f^2
"""
import sys
N = 1000

squares = [x**2 for x in range(1,N)]

# This is pretty stupid, but it works
for c in squares:
    for d in squares:
        if c + d in squares:
            b = c + d
            for f in squares:
                if b + f in squares:
                    a = b + f
                    if (a + d) % 2 == 0 == (c + f) % 2:
                        if a - c in squares:
                            e = a - c
                            x = (b + e) // 2
                            y = (c + f) // 2
                            z = b - x
                            if x > y > z > 0:
                                print(x+y+z)
                                sys.exit(0)
