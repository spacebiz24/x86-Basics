; Convert a Hexadecimal number to BCD
.MODEL SMALL
.DATA

    HEX DW 91CEH
    BCD DB 5 DUP (0)
    N1 DW 2710H ;10000
    N2 DW 3E8H  ;1000
    N3 DW 64H   ;100
    N4 DB 0AH   ;10
    MSG DB 'THE EQUIVALENT BCD IS:$'
    CRLF DB 0AH,0DH,'$'

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        
        MOV AX,HEX
        CALL HTBC
        CALL DISPLAY
        
        MOV AH,4CH
        INT 21H
        
PROC HTBC
    
        DIV N1
        MOV BCD+4,AL
        MOV AX,DX
        MOV DX,0
        DIV N2
        MOV BCD+3,AL
        MOV AX,DX
        MOV DX,0
        DIV N3
        MOV BCD+2,AL
        MOV AX,DX
        MOV DX,0
        DIV N4
        MOV BCD+1,AL
        MOV AL,AH
        MOV AH,00
        MOV BCD,AL
        
        MOV DX,OFFSET MSG
        MOV AH,9
        INT 21H
        
        RET
        
ENDP HTBC

PROC DISPLAY
        
        MOV CX,5
        MOV DI,4
        LEA BX,BCD

NEXT:   MOV DL,DI[BX]
        ADD DL,30H
        MOV AH,2
        INT 21H
        DEC DI
        LOOP NEXT
        
        MOV DX, OFFSET CRLF
        MOV AH,9
        INT 21H
        RET

ENDP DISPLAY
                
END START
