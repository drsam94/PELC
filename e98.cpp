#include <stdio.h>
#include <vector>
#include <string>
#include <cmath>
#include <unordered_map>
#include <algorithm>
// --note: requires compilation with g++ -std=c++11
//
// Some of my other C++ solutions were basically written in C
// I think the includes above probe that that is not the case for this problem

void getSquaresOfSize(int size, std::vector<long>& squares) {
    squares.clear();
    long low = (long) ceil(sqrt(pow(10.0, size - 1.0)));
    long high= (long) ceil(sqrt(pow(10.0, size)));
    for (long i = low; i < high; ++i) {
        squares.push_back(i * i);
    } 
}

// Get mapping of string, and return whether it is valid
bool getStrMapping(const std::string& str, long square, std::unordered_map<char, int>& map) {
    map.clear();
    //std::unordered_map<int, char> invmap;
    //^this was dumb
    char invmap[10];
    // ? for a debug print test, not just to be cute
    for (size_t i = 0; i < 10; ++i) { invmap[i] = '?'; }
    // Back-to-front to agree with easy order of grabbing digits
    // int because unsigned size_t will underflow and i >= 0 will always return true!
    for (int i = int(str.size() - 1); i >= 0; --i) {
        int digit = square % 10;
        if (invmap[digit] != '?' && invmap[digit] != str[i]) {
            return false;
        }
        invmap[digit] = str[i];
        map[str[i]] = digit;
        square /= 10;
    }
    return true;
}

// A return value of 0 indicates there is no square anagram with the mapping
// any other return value is the square produced by a mapping
// this method assumes anagram-ness
long squareMatch(const std::string& str, const std::unordered_map<char, int>& map) {
    long maybeSquare = 0;
    for (size_t i = 0; i < str.size(); ++i) {
        if ( i == 0 && map.at(str[i]) == 0) {
            //Will produce a number with a leading 0!
            return 0;
        }
        maybeSquare = (maybeSquare * 10) + map.at(str[i]);
    }
    long root = (long)round(sqrt((long double)maybeSquare));
    if (root * root == maybeSquare) {
        return maybeSquare;
    } else {
        return 0;
    }
}

// Thank you stack overflow and the standard library
// http://stackoverflow.com/questions/18267407/check-whether-two-strings-are-anagrams-c
// note pass-by-value important here
bool isAnagram(std::string s1, std::string s2) {
    std::sort(s1.begin(), s1.end());
    std::sort(s2.begin(), s2.end());
    return s1 == s2;

}
long max(long x, long y) { return x > y ? x : y; }

void getAnagrams(const std::string& str, const std::vector<std::string>& strings, 
        int start, std::vector<std::string>& anagrams) {
    anagrams.clear();
    for (size_t i = start; i < strings.size(); ++i) {
        if (i != 0 && isAnagram(str, strings[i])) {
            anagrams.push_back(strings[i]);
        }
    }
}

long maxAnagramForSize(int size, const std::vector<std::string>& strings) {
    std::vector<long> squares;
    if (strings.size() < 2) {
        //abort early as not to compute stupidly large squares
        return 0;
    }
    getSquaresOfSize(size, squares);
    std::unordered_map<char, int> map;
    long maxFound = 0;
    //This mass of loops doesn't look scary at all
    std::vector<std::string> anagrams;
    for (size_t i = 0; i < strings.size(); ++i) {
        getAnagrams(strings[i], strings, i+1, anagrams);
        if (anagrams.size() > 0) {
            for (size_t j = 0; j < squares.size(); ++j) {
                if (getStrMapping(strings[i], squares[j], map)) {
                    for (size_t k = 0; k < anagrams.size(); ++k) {
                        long match = squareMatch(anagrams[k], map);
                        if (match > 0) {
                            maxFound = max( max(maxFound, match), squares[j]);
                        }
                    }
                }
            }
        }
    }
    return maxFound;
}

int main (int argc, char ** argv) {
    
    std::vector< std::vector<std::string> > strings;
    // Overestimate max length
    strings.resize(20);
    for (size_t i = 0; i < strings.size(); ++i) {
        strings[i].resize(0);
    }
    char* word = NULL;
    size_t length;
    while (getdelim(&word, &length, ',', stdin) > 0) {
        const std::string& s = word;
        //pesky quotes
        const std::string realS = s.substr(1, s.size() - 3);
        strings[realS.size()].push_back(realS);
    }
    long ans = 0;
    for (size_t i = strings.size() - 1; i > 0; --i) {
        ans = maxAnagramForSize(i, strings[i]);
        if (ans > 0) {
            //Clearly an n-digit number is larger than a
            //k < n digit number
            break;
        }
    }
    printf("%ld\n", ans);
    return 0; 
}
