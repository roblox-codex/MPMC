; To find average of n numbers
.MODEL SMALL
.DATA
        VAL1    DB      ?
        NL1     DB      0AH,0DH,'ENTER HOW MANY NO U WANT:','$'
        NL2     DB      0AH,0DH,'ENTER NO:','$'
        NL3     DB      0AH,0DH,'AVEARGE:','$'
.CODE
MAIN    PROC
        MOV AX,@DATA
        MOV DS,AX

        LEA DX,NL1
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H

        MOV CL,AL
        MOV BL,AL
        MOV AL,00
        MOV VAL1,AL

LBL1:
        LEA DX,NL2
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H

        ADD AL,VAL1
        MOV VAL1,AL
        LOOP LBL1

LBL2:
        LEA DX,NL3
        MOV AH,09H
        INT 21H

        MOV AX,00
        MOV AL,VAL1
        DIV BL
        ADD AX,3030H
        MOV DX,AX
        MOV AH,02H
        INT 21H

        MOV AH,4CH
        INT 21H

MAIN    ENDP
        END     MAIN
