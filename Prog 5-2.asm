; Convert a BCD number to Hexadecimal
.MODEL SMALL
.STACK 64
.DATA

    BCD DW 4567H
    HEX DW 0
    N1 DB 0E8H,3H  ;1000
    N2 DB 64H   ;100
    N3 DB 0AH   ;10
    N4 DB 1H 
    NB_SEP DB 10H

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,N1
        
        MOV AX,BCD
        MOV AL,AH
        CALL BTHC
        MOV AX,BCD
        CALL BTHC
        
        MOV AH,4CH
        INT 21H
        
BTHC PROC NEAR
     
        MOV AH,0
        DIV NB_SEP
        PUSH AX
        MOV AH,0
        MUL N1
        ADD AX,HEX
        MOV HEX,AX
        POP AX
        MOV AL,AH
        MOV AH,0
        INC SI
        MUL SI
        ADD AX,HEX
        MOV HEX,AX
        
        LEA SI,N3
        INC SI
        RET
        
ENDP BTHC
                
END START
