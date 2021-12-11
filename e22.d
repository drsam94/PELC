import std.stdio;
import std.conv;

void main() {
    string[] arr;
    auto sum = 0;
    foreach (line; stdin.byLine()) {
        arr ~= to!string(line);
    }
    arr.sort;
    foreach (i, name; arr) {
        auto wordval = 0;
        foreach (c; name) {
            wordval += to!int(c) - to!int('A') + 1;
        }
        sum += wordval * (i + 1);
    }
    writeln(sum);
}
