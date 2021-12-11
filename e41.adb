with Ada.Text_IO; use Ada.Text_IO;
procedure e41 is
subtype Number is Long_Long_Integer range 0 .. 1000000000;
type Digit_Array is array (Positive range <>) of Number;
function isPrime (n: in Number) return Boolean is
    i : Number := 3;
begin
    if n <= 2 then
        return n = 2;
    end if;

    while i * i <= n loop
        if n mod i = 0 then
            return false;
        end if;
        i := i + 1;
    end loop;
    return true;
end isPrime;

function fac(n: in Number) return Number is
begin
    if n < 2 then
        return 1;
    end if;
    return n * fac(n - 1);
end fac;

function concatDigits(dig: Digit_Array) return Number is
begin
    if dig'Length = 1 then
        return dig(1);
    else
        return dig(dig'Last) + 10 * concatDigits(dig(dig'First .. dig'Last - 1));
    end if;
end concatDigits;

-- we iterate over n-digit pandigitals, as there are
-- 409114 n-digit pandigitals and
-- 50847534 primes that would be candidtates
-- Thus, we need the following method to find these pandigitals:
function NthLP (n: in Number; p, r: in Digit_Array) return Number is
    k : Number;
    index: Integer;
    r1: Digit_Array (1 .. r'Last - 1);
begin
    if r'Length = 1 then
        return concatDigits(p & r);
    end if;
    k := fac(r'Length - 1);
    index := Integer((n/k) + 1);
    if index = r'First then
        r1 := r(r'First + 1 .. r'Last);
    elsif index = r'Last then
        r1 := r(r'First .. r'Last - 1);
    else 
        r1 := r(r'First .. index - 1) & r(index + 1 .. r'Last);
    end if;
    return NthLP( n mod k, p & r(index), r1);
end NthLP;


dig : Digit_Array (1 .. 9) := (1, 2, 3, 4, 5, 6, 7, 8, 9);
p   : Digit_Array (1 .. 0) := (others => 0);
i: Integer;
j: Number;
cap: Number;
maxPrime: Number;
num: Number;
begin
    i := 3;
    while i <= 9 loop
        cap := fac(Number(i));
        j := 0;
        while j < cap loop
            num := NthLP(j, p, dig(1 .. i));
            if isPrime(num) then
               --as we are going in order of Lexicographic
               --permutations, this must be the largest
               maxPrime := num;
            end if;
            j := j + 1;
        end loop;
        i := i + 1;
    end loop;
    Put_Line(Long_Long_Integer'Image(maxPrime));
end e41;
