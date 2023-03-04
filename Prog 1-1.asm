; N word block transfer without overlap
.DATA

    SRC_BLK DW 123H,2345H,0ABC4H,2345H,8765H
    DSTN_BLK DW 5 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,SRC_BLK
        LEA DI,DSTN_BLK
        MOV CX,05H

LOCI:   MOV AX,[SI]
        MOV [DI],AX
        INC SI
        INC SI
        INC DI
        INC DI
        LOOP LOCI
        
        MOV AX,04CH
        INT 21H
        
END START
