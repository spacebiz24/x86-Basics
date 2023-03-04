; Find the factorial of a 16-bit unsigned integer using recurrsion
.MODEL SMALL
.DATA
    NUM DW 04H
    RES DW 2 DUP(0)

FACT    MACRO
        PUSH AX
        MUL BX
        MOV BX, AX
        POP AX
        DEC AX
ENDM

.CODE
START:  MOV AX, @DATA
        MOV DS, AX
        MOV AX, NUM
        MOV BX, 01H

FACTOR:
        CMP AX, 01H
        JA CONT
        MOV RES, BX
        MOV AH, 4CH
        INT 21H

CONT:
        FACT
        CALL FACTOR
        RET

END START