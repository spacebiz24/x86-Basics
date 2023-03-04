; Addition of 2 N byte multi precision numbers
.MODEL SMALL
.DATA

    X DB 85H,0BDH,12H,0AAH,0F8H,0DEH,0BCH,7AH
    Y DB 74H,0C1H,0FDH,7FH,97H,0D3H,56H,8AH
    Z DB 9 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        LEA SI,X
        LEA DI,Y
        LEA BX,Z
        MOV CX,8H

LOOP1:  MOV AL,[SI]
        ADC AL,[DI]
        MOV [BX],AL
        INC SI
        INC DI
        INC BX
        LOOP LOOP1
        MOV AL,00
        RCL AL,1
        MOV [BX],AL
        
        MOV AH,4CH
        INT 21H         
           
END START
