type file;
type line {
    string AARON;
}

(int sum) arraysum (int[] arr, int index, int acc) {
    if (index >= @length(arr)) {
        sum = acc;
    } else {
        sum = arraysum(arr, index+1, acc+arr[index]);
    }
}

#Incredibly long winded manner of getting the ascii value
#of a char
(int val) parseInt (string s) {
    int temp = @java("java.lang.Integer", "parseInt", s, 36);
    val = temp - 9;
}

(int val) strvalue (string str) {
    string chars[] = @strsplit(str, "");
    int values[];
    #we start at 1 to chop off strange empty char
    foreach i in [1:@length(chars)-1] {
        values[i-1] = parseInt(chars[i]);
    }
    val = arraysum(values, 0, 0);
}

#Though I might normally find it to be almost like cheating
#to call other programs, this is kind of what SwiftScript
#was made for; and its a program that is pre-installed
#on most UNIX systems.
app (file outfile) sortwords(file infile) {
    sort stdin=@filename(infile) stdout=@filename(outfile);
}

#had to add extra AARON to names.txt to get desired result
#As SwiftScript does not parse strict lists, it requires a 
#category at the top of columns of a csv type file

file original <"names.txt">;
file sorted   <"sorted_names.txt">;
sorted = sortwords(original);
line lines[] = readData("sorted_names.txt");

#Converting the array of lines to strings
string[] names;
foreach i in [0:@length(lines)-1] {
    names[i] =  lines[i].AARON;
}

#Get the name scores
int[] scores;
foreach i in [0:@length(names)-1] {
    scores[i] = (i+1) * strvalue(names[i]);
}

#Workable way to compute the sum of a list
#given the constraints of the language
int[] scoresums;
scoresums[0] = scores[0];
foreach i in [1:@length(names)-1] {
    scoresums[i] = scoresums[i - 1] + scores[i];
}
#Ensures this does not run until
#scoresums is fully written
if (@length(scoresums) == @length(scores)) {
    trace(@toString(scoresums[@length(scoresums)-1]));
}
