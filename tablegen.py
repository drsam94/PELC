import sys

extension = {
    "BrainFuck"   : "bf",
    "Haskell"     : "hs",
    "J"           : "j",
    "Ruby"        : "rb",
    "Ook!"        : "ook",
    "Racket"      : "rkt",
    "Whenever"    : "we",
    "K"           : "k",
    "Javascript"  : "html",
    "sML"         : "sml",
    "PHP"         : "php",
    "Go"          : "go",
    "cLisp"       : "lisp",
    "C"           : "c",
    "Fortran95"   : "f95",
    "Python"      : "py",
    "ELM"         : "elm",
    "Scala"       : "scala",
    "Perl"        : "pl",
    "Java"        : "java",
    "FALSE"       : "f",
    "Squirrel"    : "sq",
    "D"           : "d",
    "Ceylon"      : "ceylon",
    "Postscript"  : "ps",
    "Befunge"     : "fun",
    "Boo"         : "boo",
    "Frink"       : "fr",
    "Forth"       : "fs",
    "Shakespeare" : "spl",
    "Bash"        : "sh",
    "Batch"       : "bat",
    "Whitespace"  : "ws",
    "LOLCODE"     : "lol",
    "Lua"         : "lua",
    "Erlang"      : "erl",
    "Rust"        : "rs",
    "Ada"         : "adb",
    "Clojure"     : "clj",
    "Coffeescript": "coffee",
    "Prolog"      : "pl",
    "R"           : "r",
    "Julia"       : "ju",
    "x86-64"      : "s",
    "INTERCAL"    : "i",
    "OCaml"       : "ocaml",
    "COBOL"       : "cbl",
    "Cobra"       : "cobra",
    "C++"         : "cpp",
    "APL"         : "apl",
    "Chapel"      : "chpl",
    "C#"          : "cs",
    "WARM"        : "s",
    "Kotlin"      : "kot",
    "Pascal"      : "pas",
    "ALGOL68"     : "alg",
    "Smalltalk"   : "st",
    "Dart"        : "dart",
    "Tcl"         : "tcl",
    "Gosu"        : "gsp",
    "Rebol"       : "reb",
    "WIND"        : "s",
    "ChucK"       : "chk",
    "F#"          : "fs",
    "Fantom"      : "fan",
    "P&amp;P"     : "txt",
    "Processing"  : "pde",
    "Groovy"      : "gvy",
    "Genie"       : "gs",
    "Vala"        : "vala",
    "ArnoldC"     : "arnoldc",
    "Hack"        : "hh",
    "Rexx"        : "rexx",
    "E"           : "e",
    "BASIC"       : "bas",
    "Dogescript"  : "djs",
    "Cat"         : "cat",
    "Zimbu"       : "zu",
    "Red"         : "red",
    "Idris"       : "idr",
    "Elixir"      : "ex",
    "SwiftScript" : "swift",
    "GLSL"        : "pix",
    "PASM"        : "pasm",
    "JavaBC"      : "j",
    "CIL"         : "il",
    "X10"         : "x10",
    "Io"          : "io",
    "EEL"         : "eel",
    "Linotte"     : "liv",
    "Pike"        : "pike",
    "E#"          : "es",
    "Yeti"        : "yeti",
    "Mathematica" : "nb",
    "Moonscript"  : "ms",
    "Scratch"     : "png",
    "Ajsone"      : "json",
    "Fj\xc3\xb6lnir"     : "fjo",
    "Awk"         : "awk",
    "Swift"       : "swift",
    "Typescript"  : "ts",
    "C++TMP"      : "cpp",
    "dc"          : "dc",
    "C2"          : "c2"
}

class TableItem:
    def __init__(self, lang, text, current):
        self.lang = lang
        self.current  = current
        self.text = text

partSize = int(sys.stdin.readline()[:-1])
table = []
for line in sys.stdin:
    line = line[:-1]
    data = line.split(" ")
    if len(data) < 2:
        break
    lang = data[0]
    raw_nums = data[1:]
    nums = []
    current = 0
    for num in raw_nums:
        if num[-1] != "*":
            current = int(num)
            nums.append(current)
        else:
            nums.append(int(num[:-1]))
    text = ""
    for i in range(0,len(nums)):
        num = nums[i]
        ext = extension[lang]
        if lang == "Javascript":
            # hack for the fact that I embedded some js in html and wrote other
            # in node because I learned things over time
            if num > 100: ext = "js"
        text += '<a href="http://github.com/drsam94/PELC/blob/master/e' + str(num) + '.' + ext + '">' + str(num) + '</a>' +  (',' if i + 1 < len(nums) else ('*' if current == 0 else ''))
    table.append(TableItem(lang, text, current))

a2 = table.pop()
a1 = table.pop()
table.sort(lambda x, y: x.current - y.current)
table.append(a1)
table.append(a2)

# used for old blog-style elements
"""
def printTableElem(elem, index):
    if index % 2 == 0:
        print '<tr class="alt">'
    else:
        print '<tr>'
    sys.stdout.write("<td>" + elem.lang + "</td>\n<td>")
    sys.stdout.write(elem.text)
    print '</td></tr>'

print '<div><table border="1" id="progress">\n<tbody>'
for i in range(0, len(table)):
    printTableElem(table[i], i)
    if (i+1) % partSize == 0 and (i+1) < len(table):
        print '</tbody></table></div>\n<div><table border="1" id="progress">\n<tbody>'
print '</tbody></table></div>'
"""

def printTableLine(index):
    print '<tr>'
    i = 0
    while index + i*partSize < len(table):
        elem = table[index + i*partSize]
        sys.stdout.write("<td>%s</td>\n<td>%s</td>" % (elem.lang, elem.text))
        i += 1
    print '</tr>'

print '<div><table border="1">\n<tbody>'
for i in range(partSize):
    printTableLine(i)
print '</tbody></table></div>'
