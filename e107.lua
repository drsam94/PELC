function splitstr(line, sep)
    local t={}
    local i=1
    for str in string.gmatch(line, "([^,]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

file = io.open("network.txt", "r")
io.input(file)

line = io.read()
network = {}
n = 0
row = 0
col = 0
total_weight = 0
while line ~= nil do
    splitline = splitstr(line, ",")
    col = 0
    for e = 1, #splitline do
        elem = splitline[e]
        if elem ~= "-" then
            if col > row then
                network[n] = { tonumber(elem), row, col }
                total_weight = total_weight + tonumber(elem)
                n = n + 1
            end
        end
        col = col + 1
    end
    row = row + 1
    line = io.read()
end

-- Kruskal

union_find = {}
for n = 0, #network do
    union_find[n] = n
end

function union(uf, a, b)
    X = math.min(uf[a], uf[b])
    Y = math.max(uf[a], uf[b])
    for i = 0, #uf do
        if uf[i] == Y then
            uf[i] = X
        end
    end
end

function weightCompare(a, b)
    return a[1] < b[1]
end

ans = 0
table.sort(network, weightCompare)
for e = 1, #network do
    edge = network[e]
    if union_find[edge[2]] ~= union_find[edge[3]] then
        ans = ans + edge[1]
        union(union_find, edge[2], edge[3])
    end
end
print(total_weight - ans)
