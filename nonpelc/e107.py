class UnionFind(object):
    def __init__(self, size):
        self.sets = [i for i in range(0,size)]

    def find(self, i):
        return self.sets[i]

    def union(self, X, Y):
        X = self.find(X)
        Y = self.find(Y)
        temp = max(X, Y)
        X = min(X, Y)
        Y = temp
        for i in range(0, len(self.sets)):
            if self.sets[i] == Y:
                self.sets[i] = X

def kruskal(E):
    # returns weight of MST
    ans = 0
    uf = UnionFind(len(E))
    E.sort(key=lambda x: x["weight"])
    for e in E:
        if uf.find(e["u"]) != uf.find(e["v"]):
            ans += e["weight"]
            uf.union(e["u"], e["v"])
    return ans

E = []
for i, line in enumerate(open('network.txt', 'r')):
    for j, weight in enumerate(line[:-1].split(',')[i+1:]):
        if weight != "-":
            E.append({ "weight" : int(weight), "u" : i, "v" : i + j + 1})

total_weight = sum(e["weight"] for e in E)
print(total_weight - kruskal(E))
