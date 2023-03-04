; N byte block transfer with overlap(DSTN ends on the 6th byte position of SRC)
.MODEL SMALL
.DATA

    POS EQU 6
    DSTN_BLK DB 10-(POS+1) DUP(0)
    SRC_BLK DB 11H,22H,33H,44H,55H,66H,77H,88H,99H,0AH
    
.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,SRC_BLK
        LEA DI,DSTN_BLK
        MOV CX,10

LOOP1:  MOV AL,[SI]
        MOV [DI],AL
        INC SI
        INC DI
        LOOP LOOP1
        
        MOV AH,4CH
        INT 21H
        
END START            
