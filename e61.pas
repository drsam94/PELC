program Euler61;

var
    temp : integer;
    ans  : integer;
    t    : integer;
    i    : integer;

function nthTri(x : integer) : integer;
begin
    nthTri := (x * (x + 1)) div  2
end;
function isTri(x : integer) : Boolean;
begin
    temp  := round(sqrt(2*x + 1/4) + 1/2);
    isTri := temp * (temp + 1) / 2 = x
end;

function isSquare(x : integer) : Boolean;
begin
    temp     := round(sqrt(x));
    isSquare := temp * temp = x
end;

function isPent(x : integer) : Boolean;
begin
    temp   := round(sqrt(2/3 * x + 1 / 36) + 1/6);
    isPent := temp * (3 * temp - 1) / 2 = x
end;

function isHex(x : integer) : Boolean;
begin
    temp  := round(sqrt(x / 2 + 1 / 16) + 1/4);
    isHex := temp * (2 * temp - 1) = x
end;

function isHept(x : integer) : Boolean;
begin
    temp   := round(sqrt(2 / 5 * x + 9 / 100) + 3 / 10);
    isHept := temp * (5 * temp - 3) / 2 = x
end;

function isOct(x : integer) : Boolean;
begin
    temp  := round(sqrt(x / 3 + 1/9) + 1/3);
    isOct := temp * (3 * temp - 2) = x
end;

function shape(x,found : integer) : integer;
begin
    if isHept(x) then
        shape := 5
    else
        if isHex(x) then
            shape := 4
        else
            if isPent(x) then
                shape := 3
            else
                if isSquare(x) then
                    shape := 2
                else
                    if isOct(x) then 
                        shape := 1
                    else
                        shape := 0;
end;

function Next(x, found, sum, origin : integer) : integer;
var
    base : integer;
    s : integer;
    r : integer;
    test : integer;
    tfound : integer;
    tsum : integer;
begin
    r := 10;
    base := (x mod 100) * 100;
    while r <= 99 do
    begin
        s := 1 shl shape(base + r, found);
        if (found and s) = 0 then
        begin
            tfound := found + s;
            tsum   := sum + (base + r);
            if tfound = 63 then
            begin
                if r = origin div 100 then
                    Next := tsum
                else
                    Next := 0;
                exit;
            end

            else
            begin
                test := Next(base + r, tfound, tsum, origin);
                if test > 0 then
                begin
                    Next := test;
                    exit
                end;
            end;
        end;
        r := r + 1;
    end;
    Next := 0
end;

begin
    ans := 0;
    i := 45;
    while ans = 0 do
    begin
        t   := nthTri(i);
        if t mod 100 > 10 then
            ans := Next(t,1,t,t);
        i   := i + 1;
        if t > 9999 then
            exit;
    end;
    writeln(ans)
end.
