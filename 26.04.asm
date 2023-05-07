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
        
        
        
        
        
 ;Q1 
 ORG 100H
 NUMBER DW 40 DUP(0)
 MOV BX, OFFSET NUMBER
 MOV CX, 40
 
 NEXT:
 MOV AL, [BX]
 INC AL
 MOV [BX], AL
 ADD BX, 1
 LOOP NEXT
 RET
 
 ;Q2
 ORG 100H
 ARRAY DB 10 DUP(0)
 ARRAY_SIZE EQU 10
 MOV CX, 10
 MOV BX, OFFSET ARRAY
 MOV AH, 38D
 MOV DL, 0H
 MOV DH, 10D
 NEXT : MOV AL, [BX]
 MOV AL, AH
 INC AH
 MOV [BX], AL
 ADD DL, AL
 LOOP NEXT:
 MOV AX, 0000H
 MOV AL, DL
 DIV DH
 HLT RET

;Q3
org 100h
array DW 15 dup(0) 
mov cx, 15 
mov si, offset array 
mov [si],00D
add si,2 
mov ax,00D
mov bx,01D 
loop_start: 
 mov dx,ax
 add ax,bx
 mov [si], ax 
 mov bx,dx 
 add si, 2 
 
 loop loop_start 
 
 hlt
 ret
