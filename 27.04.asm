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
data segment
STRING1 DB 08h,14h,05h,0Fh,09h
res db ?
data ends
 
code segment
assume cs:code, ds:data
start: mov ax, data
mov ds, ax
mov cx, 04h
 
mov bl, 00h
LEA SI, STRING1
up:
mov al, [SI]
cmp al, bl
jl nxt
mov bl, al
nxt:
inc si
dec cx
jnz up
 
mov res,bl
int 3
code ends
end start
