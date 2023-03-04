; Reverse a given string and check if it's a palindrome
.MODEL SMALL
.DATA

    STR1 DB "MADAM"
    CRLF DB 0DH,0AH,"$"
    LEN EQU CRLF-STR1
    STR2 DB LEN DUP(0),"$"
    MSG1 DB "STRING IS A PALINDROME $"
    MSG2 DB "STRING IS NOT A PALINDROME $"

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX 
        LEA SI,STR1
        MOV DI,OFFSET STR2+LEN-1
        MOV CX,LEN
        
REV:    CLD
        LODSB
        STD
        STOSB
        LOOP REV        
        
        LEA SI,STR1
        LEA DI,STR2
        MOV CX,LEN
        CLD
        REPE CMPSB
        JNE NPAL        
        MOV AH,09H
        LEA DX,MSG1
        INT 21H
        JMP EXIT
        
NPAL:   MOV AH,09H
        LEA DX,MSG2
        INT 21H
        
EXIT:   MOV AH,4CH
        INT 21H

END START
