; Find the HCF of 2 16-bit unsigned integers
.MODEL SMALL
.DATA
    
     X DW 24
     Y DW 15
     RES DW 0
    
.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        MOV CX,0
        MOV AX,X
        SUB AX,Y
        MOV CX,AX
        MOV RES,AX
        JMP BACK1

FAC:    MOV AX,RES
        MOV DX,0
        DEC CX
        DIV CX
        CMP DX,0
        JNE FAC
        
BACK1:  MOV AX,X
        DIV CX
        CMP DX,0
        JNE FAC
        MOV AX,Y
        DIV CX
        CMP DX,0
        JNE FAC
        
EXIT:   MOV RES,CX
        MOV AH,4CH
        INT 21H
            
END START
