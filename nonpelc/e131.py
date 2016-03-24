from euler import isPrime

# Upper bound is hackery, probably can be made formal
N = 2000000000
cubes = [x**3 for x in range(1, 2 + int(N**(1/3)))]
# Crucial observation: For n^3 + n^2 p to be a perfect cube,
# n^2 (thus n) and n + p must be perfect cubes
ps = set()
for i,x in enumerate(cubes):
    for j in range(i+1, len(cubes)):
        if isPrime(cubes[j] - x):
            if cubes[j] - x < 1e6:
                ps.add(cubes[j] - x)
print(ps)
print(len(ps))
