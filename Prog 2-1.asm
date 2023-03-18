; check if the 8-bit data is 2out of 5 code and/or Bitwise palindrome and/or nibblewise palindrome
.MODEL SMALL
.DATA

    NUM DB 0BBH
    RES DB 3 DUP(0)
    COUNT DB 0

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        MOV AH,0H
        MOV CX,5H

        MOV AL, NUM
        TEST AL,0E0H
        JNZ N2O5
        

LOOP1:  ROR AL,1H
        JNC LOOP2
        INC COUNT
        
LOOP2:  LOOP LOOP1
        CMP COUNT,2H
        JZ BPAL1

N2O5:   MOV RES,0FFH

BPAL1:  MOV AL,NUM
        MOV CX,8H
        
BPAL2:  ROR AL,1H
        RCL AH,1H
        LOOP BPAL2
        CMP AH,AL
        JE NPAL
        MOV 1[RES],0FFH

NPAL:   MOV BL,AL
        AND AL,0F0H
        AND BL,0FH
        ROL BL,4H
        CMP BL,AL
        JE ED
        MOV 2[RES],0FFH        
        
ED:     MOV AH,04CH
        INT 21H
        
        END START
