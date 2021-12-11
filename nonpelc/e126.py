def cubes(w, d, h, l):
    c = 2 * (w * h + w * d + d * h)
    for i in range(l - 1):
        c += 4 * (w + d + h + 2 * i)
    return c


assert cubes(3, 2, 1, 1) == 22
assert cubes(3, 2, 1, 2) == 46
assert cubes(3, 2, 1, 3) == 78
assert cubes(3, 2, 1, 4) == 118
assert cubes(5, 1, 1, 1) == 22
assert cubes(5, 3, 1, 1) == 46
assert cubes(7, 2, 1, 1) == 46
assert cubes(11, 1, 1, 1) == 46

maxValue = 30000
C = [0] * maxValue
top = 5000
for x in range(1, top):
    for y in range(1, x + 1):
        if (cubes(x, y, 1, 1)) >= maxValue:
            break
        for z in range(1, y + 1):
            l = 1
            val = cubes(x, y, z, l)
            while val < maxValue:
                C[val] += 1
                l += 1
                val = cubes(x, y, z, l)


assert C[22] == 2
assert C[46] == 4
assert C[78] == 5
assert C[118] == 8
assert C[154] == 10
print([(x, y) for x, y in enumerate(C) if y == 1000])
vals = [(x, y) for x, y in enumerate(C)]
vals.sort(key=lambda elem: -elem[1])
print(vals[:10])
