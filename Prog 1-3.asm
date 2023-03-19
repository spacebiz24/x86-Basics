; N byte block transfer with overlap(DSTN starting at the 6th byte position of SRC)
.MODEL SMALL
.DATA

    POS EQU 6
    SRC_BLK DB 11H,22H,33H,44H,55H,66H,77H,88H,99H,0AH
    DSTN_BLK DB POS DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,SRC_BLK+9
        LEA DI,DSTN_BLK+(POS-1)
        MOV CX,10

LOOP1:  MOV AL,[SI]
        MOV [DI],AL
        DEC SI
        DEC DI
        LOOP LOOP1
        
        MOV AH,4CH
        INT 21H
        
END START  
