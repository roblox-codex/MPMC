;Q1. A program to find out the largest number from a given unorderd array of 8-bit numbers stored in location starting from a known address.
;Q2. Repeat for 16-bit numbers.
;Q3. Write a program to find out the number of even and odd numbers from a given series of 16-bit hexadecimal numbers.
;Q4. Write a program to findout the number of positive numbers and negative numbers from a given series of signed numbers.

;ANS: 1
ORG 100H
       MOV AX, 6000H;
       MOV DS, AX;
       MOV AL, 30H;
       MOV BX, 1000H;
       MOV CX, 96H;
ARRAY: MOV [BX], AL;
       ADD AL, 50D;
       INC BX;
       LOOP ARRAY;
       MOV BX, 1000H;
       MOV AL, [BX];
       MOV CX, 1FH;
L1: CMP AL, [BX+1];
       JNC L2
       MOV AL, [BX+1]
L2: INC BX;
       LOOP L1;
       MOV [0FFFH], AL
       HLT

;ANS: 2
ORG 100H
       MOV AX, 6000H;
       MOV DS, AX;
       MOV AX, 30H;
       MOV BX, 1000H;
       MOV CX, 96H;
ARRAY: MOV [BX], AX;
       ADD AX, 50D;
       INC BX;
       LOOP ARRAY;
       MOV BX, 1000H;
       MOV AX, [BX];
       MOV CX, 1FH;
L1: CMP AX, [BX+2];
       JNC L2
       MOV AX, [BX+2]
L2: INC BX;
       LOOP L1;
       MOV [0FFFH], AX
       HLT

;ANS: 3
.MODEL SMALL
.DATA
.CODE
BACK:
NEXT:
SKIP:
ARRAY DB 12H, 98H, 45H, 83H, 28H, 67H, 92H, 54H, 63H, 76H ARR_EVEN DB 
10 DUP (?)
ARR_ODD DB 10 DUP (?)
MOV AX, @DATA      ; INITIALIZE THE DATA SEGMENT
MOV DS, AX
MOV CL, 0AH        ; INITIALIZE THE COUNTER
XOR DI, DI         ; INITIALIZE THE ODD POINTER
XOR SI, SI         ; INITIALIZE THE EVEN POINTER
LEA BP, ARRAY
MOV AL, DS:[BP]    ; GET THE NUMBER
TEST AL, 01H ; MASK ALL BITS EXCEPT LSB
JZ NEXT ; IF LSB = 0 GOT TO NEXT
LEA BX, ARR_ODD
MOV [BX+DI], AL
INC DI              ; INCREMENT THE ODD 
POINTER JMP SKIP
LEA BX, ARR_EVEN
MOV [BX+SI], AL
INC SI              ; INCREMENT THE EVEN POINTER
INC BP              ; INCREMENT ARRAY BASE POINTER
LOOP BACK           ; DECREMENT THE 
COUNTER MOV AH, 4CH
INT 21H
END                 ; END PROGRAM

;ANS: 4
.MODEL SMALL
.DATA
.CODE
BACK:
NEXT:
SKIP:
ARRAY DB 12H, -98H,-45H,83H,-28H, 67H, 92H, -54H, -63H, 76H NEGI DB 10 
DUP (?)
POSI DB 10 DUP (?)
MOV AX, @DATA               ; INITIALIZE THE DATA SEGMENT
MOV DS, AX
MOV CL, 0AH                 ; INITIALIZE THE COUNTER
XOR DI, DI                  ; INITIALIZE THE POINTER FOR NEGATIVE NUMBER
XOR SI, SI                  ; INITIALIZE THE POINTER FOR POSITIVE NUMBER
LEA BP, ARRAY
MOV AL, DS:[BP]             ; GET THE NUMBER
TEST AL, 80H                ; MASK ALL BITS EXCEPT MSB
JZ NEXT ; IF LSB = 0 GOT TO NEXT
LEA BX, NEGI
MOV [BX+DI], AL
INC DI                      ; INCREMENT THE NEGATIVE 
POINTER JMP SKIP
LEA BX, POSI
MOV [BX+SI], AL
INC SI                      ; INCREMENT THE POSITIVE POINTER
INC BP                      ; INCREMENT ARRAY BASE POINTER
LOOP BACK                   ; DECREMENT THE 
COUNTER MOV AH, 4CH
INT 21H
END                         ; END PROGRAM
