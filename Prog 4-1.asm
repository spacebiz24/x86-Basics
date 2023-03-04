; Find the LCM of 2 16-bit unsigned integers
.MODEL SMALL
.DATA

    X DW 28
    Y DW 12
    Z DW 2 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        MOV CX,0

LOOP1:  MOV AX,X
        INC CX
        MUL CX
        MOV BX,AX
        DIV Y
        CMP DX,0
        JNE LOOP1
        MOV Z,BX
        
        MOV AH,4CH
        INT 21H
        
        END START
          
