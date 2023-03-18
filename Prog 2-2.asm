; check if the given 8-bit data is +ve or -ve and/or odd or even and find the number of 1's and 0's
.MODEL SMALL
.DATA
    
    NUM DB -0H
    RES DB 2 DUP(0H)
    N_1S DB 0H
    N_0S DB 8H

.CODE
    
    MOV AX,@DATA
    MOV DS,AX
    LEA SI,NUM
    MOV AX,[SI]
    MOV CX,8H
    
PN: ROL AL,1H
    JNC EO
    MOV BYTE PTR [RES],1H

EO: MOV AX,[SI]
    ROR AX,1H
    MOV AX,[SI]
    JNC Z1
    MOV BYTE PTR 1[RES],1H

Z1: ROR AX,1H
    JNC Z2
    DEC N_0S
    INC N_1S
    
Z2: LOOP Z1

    MOV AH,04CH
    INT 21H
    
    END    
