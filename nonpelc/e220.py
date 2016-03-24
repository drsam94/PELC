
# a -> aRbFR

# b -> LFaLb

# F forward, L left 90, R right 90

def expand(s):
    return "aRbFR".join(["LFaLb".join(x.split('b')) for x in s.split('a')])

def expandFirstA(s):
    return "FaRbFR" + s[2:]

D = "Fa"
for i in range(0, 50):
    D = expand(D)[:10000]
    print(D)
turns = D.replace('a','').replace('b','').split('F')
simple = ['R' if x == 'RRL' else ('L' if x == "RLL" else x) for x in turns]
print([1 if x == 'R' else 0 for x in simple])
#print([1 if x == 'RRL' else 0 for x in D.split('F')[::2]])
