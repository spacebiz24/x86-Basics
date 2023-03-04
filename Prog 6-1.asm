; Bubble sort in ascending order
.MODEL SMALL
.DATA

        X DW 0ABCDH,34H,0FFFFH,7867H,2345H,5678H,012H,01H,7896H,1CBDH
        LEN EQU 10 
        FLAG DB ?
        NB_SEP DB 10H
        ASCII_TABLE DB "0123456789ABCDEF"
        PRINT_H DB "H $" 
        CRLF DB 0DH,0AH,"$"
        
.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        
BACK1:  LEA SI,X
        MOV FLAG,0
        MOV CX,LEN-1
        
LOOP1:  MOV AX,[SI]
        MOV BX,[SI+2]
        CMP AX,BX
        JAE SKIP 
        MOV [SI+2],AX
        MOV [SI],BX
        MOV FLAG,1
        
SKIP:   ADD SI,2
        LOOP LOOP1
        
        CMP FLAG,1
        JE BACK1
        
        LEA SI,X
        LEA BX,ASCII_TABLE
        MOV CX,LEN
        
DISP:   MOV AX,[SI]
        MOV AL,AH
        CALL DISPLAY
        MOV AX,[SI]
        CALL DISPLAY
        
        MOV AH,9H
        LEA DX,PRINT_H
        INT 21H 
        
        ADD SI,2
        LOOP DISP
        
        MOV AH,9H
        LEA DX,CRLF
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
PROC DISPLAY

        MOV AH,0
        DIV NB_SEP
        PUSH AX
        XLAT
        MOV DL,AL
        MOV AH,2H
        INT 21H
        POP AX
        MOV AL,AH
        XLAT
        MOV DL,AL
        MOV AH,2
        INT 21H 
     
    RET
ENDP DISPLAY

END START
