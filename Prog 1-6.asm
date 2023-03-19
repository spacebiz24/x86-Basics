; interchange word blocks using XCHG instruction
.DATA

    X_BLOCK DW 0123H,3456H,789H,0BCDEH,0F231H
    Y_BLOCK DW 1122H,3344H,5566H,7788H,0AABBH

.CODE


START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,X_BLOCK
        LEA DI,Y_BLOCK
        MOV CX,5H

LOCI:   MOV AX,[SI]
        XCHG [DI],AX
        MOV [SI],AX
        INC DI
        INC DI
        INC SI
        INC SI
        LOOP LOCI
        
        MOV AX,04CH
        INT 21H


END START
