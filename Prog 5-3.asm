; Add and Subtract 2 strings of ASCII digits
.MODEL SMALL
.DATA

        ASC_STR1 DB '7897'
        ASC_STR2 DB '5632'
        LEN EQU 4
        ADD_RES DB LEN+1 DUP(0)
        SUB_RES DB LEN+1 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        
        LEA SI,ASC_STR1+LEN-1
        LEA DI,ASC_STR2+LEN-1
        LEA BX,ADD_RES+LEN
        PUSH SI
        PUSH DI
        MOV CX,LEN
        MOV AX,0
        CLC

LOOP1:  MOV AL,[SI]
        ADC AL,[DI]
        AAA
        MOV [BX],AL
        DEC SI
        DEC DI
        DEC BX
        LOOP LOOP1
        
        MOV AX,0
        RCL AH,1
        MOV [BX],AH
        
        POP DI
        POP SI
        LEA BX,SUB_RES+LEN
        MOV CX,LEN
        MOV AX,0
        CLC
        
LOOP2:  MOV AL,[SI]
        SBB AL,[DI]
        AAS
        MOV [BX],AL
        DEC SI
        DEC DI
        DEC BX
        LOOP LOOP2
        
        MOV AX,0
        RCL AH,1
        MOV [BX],AH
        
        MOV AH,4CH
        INT 21H

END START
