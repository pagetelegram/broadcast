' Teleprompter v1.0 by Jason Page, loads any txt in load directory and makes text large teleprompter

DIM fi(1 TO 500) AS STRING
DIM l(1 TO 500) AS STRING
CLS
SCREEN 13
c = 1
SHELL "ls *.txt > files.dat"
OPEN "files.dat" FOR INPUT AS #1
c = 0
DO
c = c + 1
IF NOT (EOF(1)) THEN INPUT #1, fi$(c)
LOOP UNTIL EOF(1)
CLOSE #1
IF c = 1 THEN PRINT "No txt files in same folder as program.": BEEP: SLEEP: SYSTEM
esc = 0
FOR i = 1 TO c
PRINT fi$(i);
NEXT i

PRINT "Format these txt files to fit screen (Y/N)"
DO
SELECT CASE INKEY$
 CASE CHR$(27): SYSTEM
 CASE "Y", "y"
  esc = 1

 CASE "N", "n": esc = 1
END SELECT
LOOP UNTIL esc = 1



d = 1
f = 1
pl = 1
ky = 1
DO
SELECT CASE INKEY$
CASE CHR$(0) + "M"
IF d < c THEN
d = d + 1: f = 1: ky = 1: pl = 1
ELSE
BEEP
END IF
CASE CHR$(0) + "K"
IF d > 1 THEN
d = d - 1: ky = 1: f = 1: pl = 1
ELSE
BEEP
END IF
CASE CHR$(0) + "H"
IF pl > 1 THEN
 pl = pl - 1: f = 1: ky = 1
ELSE
 BEEP
END IF
CASE CHR$(0) + "P"
IF pl < cc THEN
 pl = pl + 1
 f = 1
 ky = 1
ELSE
 BEEP
END IF
CASE CHR$(27): SYSTEM
CASE CHR$(13): f = 1
END SELECT

IF ky = 1 THEN
 OPEN fi$(d) FOR INPUT AS #2
  cc = 0
  DO
   cc = cc + 1
   'PRINT cc; " "; d; fi$(d);
   IF NOT (EOF(2)) THEN
    INPUT #2, l$(cc)
   END IF
  LOOP UNTIL EOF(2)
 CLOSE #2
  co = 1
 'CLS
  FOR i = 1 TO 20
   
   IF pl < cc AND pl >= 1 THEN
    IF i < 10 THEN COLOR 7
    IF i >= 10 AND i <= 13 THEN COLOR 15
    IF i > 13 THEN COLOR 7
    
    IF i + pl - 1 < cc THEN
    IF i = 1 THEN CLS
    LOCATE i + 1, 1: PRINT l$(i + pl - 1): LOCATE 1, 1: PRINT d; fi$(d); " Pl:"; pl; " Lines Total:"; cc: f = 0
    END IF
   END IF

  NEXT i
 ky = 0
END IF

LOOP

SUB frmt
 SHELL "mv *.txt *.fmt"
 SHELL "ls *.fmt > fmt.dat"
OPEN "fmt.dat" FOR INPUT AS #3
IF NOT (EOF(3)) THEN
INPUT #3, fmt$
  OPEN fmt$ FOR INPUT AS #4
   IF NOT (EOF(4)) THEN INPUT #4, ot$
    DO
     ct = ct + 1
      IF ct MOD 40 = 1 THEN 
       SHELL "echo " + MID$(ot$, 40, ct) + " >> " + MID$(fmt$, LEN(fmt$) - 3, len(fmt$)) + "txt"
      END IF    
    LOOP UNTIL ct > LEN(ot$)
 CLOSE #4
END IF
CLOSE #3
END SUB
