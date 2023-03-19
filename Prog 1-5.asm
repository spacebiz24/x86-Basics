; interchange word blocks using stack operations
.DATA
    X_BLOCK DW 0123H,3456H,789H,0BCDEH,0F231H
    Y_BLOCK DW 1122H,3344H,5566H,7788H,0AABBH
.CODE


START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,X_BLOCK
        LEA DI,Y_BLOCK
        MOV CX,5H

LOC1:   PUSH [SI]
        PUSH [DI]
        POP  [SI]
        POP  [DI]
        INC SI
        INC SI
        INC DI
        INC DI
        LOOP LOC1
        
        MOV AX,04CH
        INT 21H


END START
