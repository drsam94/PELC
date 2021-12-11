BEGIN

[1:7] INT a := (1,2,5,10,20,50,100);
INT ways := 1;

PROC helper = (INT amountindex, inheritedamount) VOID:
BEGIN
    INT current;
    BOOL done := FALSE;   
    FOR i FROM 0 BY 1 TO 200 WHILE NOT done
    DO
        current := inheritedamount + (i * a[amountindex]);
        IF current > 200
            THEN done := TRUE
            ELIF current = 200
            THEN ways +:= 1;
                 done := TRUE
            ELIF amountindex < 7
            THEN helper(amountindex + 1, current)
        FI
    OD
END;

helper(1,0);
write((ways, new line))          
END
