; Addition & subtraction of 2 16-bit numbers
.MODEL SMALL
.DATA

    X DW 0FFFFH
    Y DW 0FFFFH
    SUM DW 2 DUP(0)
    DIF DW 2 DUP(0)

.CODE

START:  MOV AX,@DATA
        MOV DS,AX

ADD1:   MOV AX,X
        ADD AX,Y
        MOV SUM,AX
        JNC SUB1
        INC 2[SUM]

SUB1:   MOV AX,X
        SUB AX,Y
        MOV DIF,AX
        JNC ED
        MOV 2[DIF],0FFFFH       
          
ED:     MOV AH,04CH
        INT 21H
        
        END START
