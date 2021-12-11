       IDENTIFICATION DIVISION.
       PROGRAM-ID.  Euler21.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  LoopCount          PIC S99999 VALUE ZEROS.
       01  LoopCount2         PIC S99999 VALUE ZEROS.
       01  Result             PIC S99999 VALUE ZEROS.
       01  Temp               PIC S99999 VALUE ZEROS.
       01  Temp2              PIC S99999 VALUE ZEROS.
       01  X                  PIC S99999 VALUE ZEROS.
       01  SQRX               PIC S99999 VALUE ZEROS.
       01  ANS                PIC S99999 VALUE ZEROS.

       PROCEDURE DIVISION.
       Begin.
       PERFORM mainLoopBody WITH TEST AFTER
       VARYING LoopCount2 From 3 By 1
       UNTIL LoopCount2 Equal 9999.
       DISPLAY ANS.
       STOP RUN.

       sumOfDivisors.
       SUBTRACT Result FROM Result.
       ADD 1 TO Result.
       COMPUTE SQRX = FUNCTION SQRT (X).
       MULTIPLY SQRX BY SQRX GIVING Temp.
       IF Temp EQUAL X THEN
       ADD SQRX TO Result
       END-IF.
       SUBTRACT 2 FROM SQRX.
       PERFORM LoopBody WITH TEST AFTER
       VARYING LoopCount FROM 2 BY 1
       UNTIL LoopCount GREATER THAN SQRX.
       LoopBody.
       COMPUTE Temp = FUNCTION MOD (X LoopCount).
       IF Temp EQUAL ZERO THEN
       ADD LoopCount to Result
       DIVIDE X By LoopCount GIVING TEMP
       ADD Temp to Result
       END-IF.

       mainLoopBody.
       COMPUTE X = LoopCount2.
       PERFORM sumOfDivisors.
       COMPUTE Temp2 = Result.
       COMPUTE X = Temp2.
       PERFORM sumOfDivisors.
       IF LoopCount2 NOT EQUAL Temp2 THEN
       IF LoopCount2 EQUAL Result THEN
       ADD LoopCount2 to ANS
       END-IF
       END-IF.

