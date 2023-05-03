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
L1: CMP AX, [BX+1];
       JNC L2
       MOV AX, [BX+1]
L2: INC BX;
       LOOP L1;
       MOV [0FFFH], AX
       HLT
