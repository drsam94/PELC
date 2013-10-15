use Sort;

var line: string = read(string);
var ans: int = 0;
const D: domain(1) = (0..4);
var hand1: [D] string;
var hand2: [D] string;
//Chapel has no nice way to test for EOF, so I added END
//to the end of the file.
while line != "END" { 
    hand1[0] = line;
    for i in 1..4 do hand1[i] = read(string);
    for i in D    do hand2[i] = read(string);
    if handValue(hand1) > handValue(hand2) {
        ans += 1;
    } else if handValue(hand1) == handValue(hand2) {
        if higherCards(hand1, hand2) == 1 then ans += 1;
    } 
    line = read(string);
}
writeln(ans: string);

proc higherCards(hand1: [D] string, hand2: [D] string): int {
    var vals1: [D] int;
    var vals2: [D] int;
    forall i in D {
        vals1[i] = toNumber(hand1[i].substring(1));
        vals2[i] = toNumber(hand2[i].substring(1));
    }
    BubbleSort(vals1);
    BubbleSort(vals2);
    for i in D {
        if vals1[4 - i] > vals2[4 - i] then return 1;
        if vals1[4 - i] < vals2[4 - i] then return 2;
    }
    return 1;
}

proc toNumber(num: string): int {
    if num == "T" then return 8;
    if num == "J" then return 9;
    if num == "Q" then return 10;
    if num == "K" then return 11;
    if num == "A" then return 12;
    return (num: int) - 2;
}

proc handValue(hand: [D] string): int {
    var suits: [D] string;
    var vals: [D] int;
    var isStraight: bool = false;
    var isFlush: bool = false;
    forall i in D {
        suits[i] = hand[i].substring(2);
        vals[i] = toNumber(hand[i].substring(1));
    }
    BubbleSort(vals);
    if vals[0] + 1 == vals[1] && vals[1] + 1 == vals[2] &&
       vals[2] + 1 == vals[3] && vals[3] + 1 == vals[4] 
                             then isStraight = true;
        
    if suits[0] == suits[1] && suits[1] == suits[2] && 
       suits[2] == suits[3] && suits[3] == suits[4] 
                             then isFlush = true;
    
    if isFlush && isStraight then return 104;

    if (vals[0] == vals[1] && vals[1] == vals[2] && vals[2] == vals[3]) ||
       (vals[1] == vals[2] && vals[2] == vals[3] && vals[3] == vals[4])
                             then return 91 + vals[2];

    if (vals[0] == vals[1] && vals[2] == vals[3] && vals[3] == vals[4]) ||
       (vals[0] == vals[1] && vals[1] == vals[2] && vals[3] == vals[4])
                             then return 78  + vals[2];
 
    if isFlush               then return 65;
    if isStraight            then return 52;

    if (vals[0] == vals[1] && vals[1] == vals[2]) ||
       (vals[1] == vals[2] && vals[2] == vals[3]) ||
       (vals[2] == vals[3] && vals[3] == vals[4])
                             then return 39  + vals[2];

    if (vals[0] == vals[1] && vals[2] == vals[3]) ||
       (vals[0] == vals[1] && vals[3] == vals[4]) ||
       (vals[1] == vals[2] && vals[3] == vals[4])
                             then return 26  + max(vals[1], vals[2]);

    if vals[0] == vals[1] || vals[1] == vals[2]
                             then return 13 + vals[1];

    if vals[2] == vals[3] || vals[3] == vals[4]
                             then return 13 + vals[3];
    return vals[4];
}
