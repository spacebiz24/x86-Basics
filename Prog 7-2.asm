; Search the occurrence of a character in a string by input from the user
.MODEL SMALL
.DATA
    
     STR DB 12,?,10 DUP(0)
     MSG1 DB "ENTER THE STRING: $"
     MSG2 DB "ENTER THE CHARACTER TO FIND: $"
     MSG3 DB "STRING FOUND AT: $"
     MSG4 DB "STRING NOT FOUND $" 
     CRLF DB 0AH,0DH,"$" 
     NB_SEP DB 10H 
    
.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX
        
        MOV AH,9H
        LEA DX,MSG1
        INT 21H
        MOV AH,0AH
        LEA DX,STR
        INT 21H
        MOV AH,9H
        LEA DX,CRLF
        INT 21H
        
        MOV AH,9H
        LEA DX,MSG2
        INT 21H
        MOV AH,1H
        INT 21H
        PUSH AX
        MOV AH,9H
        LEA DX,CRLF
        INT 21H
        
        POP AX
        LEA DI,STR+2
        MOV CL,STR+1
        
        REPNE SCASB
        JNE NFOUND
        MOV AH,9H
        LEA DX,MSG3
        INT 21H
        CALL POS_FIND
        JMP EXIT

NFOUND: MOV AH,9H
        LEA DX,MSG4
        INT 21H
        
EXIT:   MOV AH,4CH
        INT 21H 
        
PROC POS_FIND
    
        MOV AX,DI
        SUB AX,2
        CMP AL,10
        JB SKIP
        ADD AL,6

SKIP:   DIV NB_SEP
        OR AX,3030H
        PUSH AX
        MOV AH,2H
        MOV DL,AL
        INT 21H
        POP AX
        MOV DL,AH
        MOV AH,2
        INT 21H
    
    RET 
ENDP     
        
END START
