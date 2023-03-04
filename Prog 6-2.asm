; Find the largest and smallest elements in the array and their locations
.MODEL SMALL
.DATA
    
     X DW 3598H,5745H,79A5H,0B245H,01H,4005H,0F12H,2005H,0DCABH,1000H
     LARG DW 2 DUP(0)
     SMAL DW 2 DUP(0)
    
.CODE

START:  MOV AX,@DATA
        MOV DS,AX
        
        LEA SI,X
        MOV AX,[SI]
        MOV LARG,AX
        MOV SMAL,AX
        ADD SI,2
        MOV CX,9
        
LAR:    MOV AX,[SI]
        CMP LARG,AX
        JAE SMA
        MOV LARG,AX
        MOV LARG+2,SI
        
SMA:    CMP SMAL,AX
        JBE SKIP
        MOV SMAL,AX
        MOV SMAL+2,SI
        
SKIP:   ADD SI,2
        LOOP LAR              

EXIT:   MOV AH,4CH
        INT 21H     
        
END START
