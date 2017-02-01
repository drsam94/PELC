import math
from euler import memoize

mins = {}
bests = {}
CAP = 200
def generate(knowns, step):
    if step > int(2*math.log(CAP, 2)):
        return
    for x in knowns:
        for y in knowns:
            if x + y > CAP:
                continue
            if x + y not in mins or step + 1 <= mins[x+y]:
                if x + y not in mins or step + 1 < mins[x+y]:
                    bests[x+y] = [{x,y}]
                elif {x,y} in bests[x+y]:
                    continue
                else:
                    bests[x+y].append({x,y})
                mins[x+y] = step + 1
                generate(knowns + [x + y], step + 1)


generate([1], 0)
print(sum(val for (key, val) in mins.items()))
