; Multiplication of 2 32-bit unsigned hexadecimal numbers
.MODEL SMALL
.DATA

    X DW 0AABBH,0C56EH
    Y DW 1234H,397DH
    RES DW 4 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
       
M1:     MOV AX,[X]
        MUL [Y]
        MOV [RES],AX
        MOV [RES+2],DX
        
M2:     MOV AX,[X+2]
        MUL [Y+2]
        MOV [RES+4],AX
        MOV [RES+6],DX
        
M3:     MOV AX,[X+2]
        MUL [Y]
        ADD AX,[RES+2]
        MOV [RES+2],AX
        ADC DX,[RES+4]
        MOV [RES+4],DX
        JNC M4
        INC [RES+6]

M4:     MOV AX,[X]
        MUL [Y+2]
        ADD AX,[RES+2]
        MOV [RES+2],AX
        ADC DX,[RES+4]
        MOV [RES+4],DX
        JNC EXIT
        INC [RES+6]
        
EXIT:   MOV AH,4CH
        INT 21H
  
END START
