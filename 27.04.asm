;Q1 - Find out the largest number from an unorderd array of sixteen 8-bit numbers, stored sequentially in the memory location atarting at offset 0500H in the segment 2000H in assebly

ORG 100H
MOV AX, 6000H;
MOV DS, AX;
MOV BX, 5000H;
MOV DL, 15D;
MOV CX, 15D;

L1: MOV [BX], DL;
INC BX;
ADD DL, 10D;
JMP: L1;

;Q1 Another answer
ORG 100H

MOV AX, 2000H
MOV DS, AX
MOV AL, [0500H]
MOV CX, 15  
MOV SI, 0501H  

LOOP_START:
CMP [SI], AL  
JBE NEXT_NUM  
MOV AL, [SI]  
NEXT_NUM:
INC SI  
LOOP LOOP_START  

MOV AX, 2000H  ; set segment register
MOV DS, AX

MOV AL, [0500H]  ; load first number as current maximum

MOV CX, 15  ; initialize loop counter
MOV SI, 0501H  ; initialize pointer to next number

LOOP_START:
CMP [SI], AL  ; compare next number with current maximum
JBE NEXT_NUM  ; if next number is less than or equal to current maximum, skip to next number
MOV AL, [SI]  ; otherwise, update current maximum with next number
NEXT_NUM:
INC SI  ; move pointer to next number
LOOP LOOP_START  ; repeat until all numbers have been compared

; AL now contains the largest number in the array

;Final Answer of Q1
ORG 100H
MOV AX, 6000H;
MOV DS, AX;
MOV BX, 5000H;
MOV DL, 15D;
MOV CX, 15D;

L1: MOV [BX], DL;
INC BX;
ADD DL, 10D;

LOOP L1;
MOV AX, 0000H;
MOV DX, 0000H;
MOV BX, 5000H;
MOV CX, 15D;

L2: MOV AL, [BX];
ADD DX, AX;
INC BX;
LOOP L2;
HLT;
