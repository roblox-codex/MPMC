;Arithmetic Instruction
;Add
MOV AX, 0010H;
MOV BX, 010FH;

ADD AX, 0010H;
ADD AX, BX;
ADD AX,[SI];
ADD AX,[6000H];
ADD [6000H], 0010H;
ADD AX,0010H;

;Add with Carry

MOV AX, 0FFFH;
MOV BX, 1000H;

ADC AX, 0100H;
ADC AX, BX;
ADC AX, [SI];
ADC AX, [3000H]
ADC [3000H], 0100H;

;Increment

MOV AX, 0FFFH;
MOV BX, 1000H;

INC AX;
INC [BX];
INC [3000H]

;Decrement
MOV AX, 0FFFH;
MOV BX, 2000H;

DEC AX;
DEC BX;

;Subtract
MOV AX, 0FFFH;
MOV BX, 2000H;
MOV [6000H], 3000H;

SUB AX, 1000H;
SUB AX, BX;
SUB AX, [6000H];
SUB [6000H], 1000H; 

;Subtract with Borrow
MOV AX, 0FFFH;
MOV BX, 2000H; 

SBB AX, 0100H;
SBB AX, BX;
SBB AX, [2500H];
SBB [2500H], 0100H;

;Compare
MOV AX, 0FFFH;
MOV BX, 2000H; 

CMP BX, 0100H;
CMP AX, 0100;
CMP [5000H], 0100H;
CMP BX, [SI];
CMP BX, CX;

;Adjust after addition
ORG 100h         
MOV AL, 032H     ;Sets AL to 32H
AAA          
RET  

;DAS
ORG 100h 
MOV AX, 02FCH  ;Sets AX to 02FCH  
MOV BX, 1152H  ;Sets BX to 1152H
SUB AX, BX     ;Compute AX-BX
DAS  
RET 

;AAS
ORG 100h 
MOV AX, 00F9H  ;Sets AX to 00F9H  
MOV BX, 1152H  ;Sets BX to 0022H
SUB AX, BX     ;Compute AX-BX
DAS  
RET

;MUL
ORG 100h
.CODE
MOV AL, 35
MOV BH, 15
MUL BH
RET

;IMUL
ORG 100h
.MODEL SMALL
.CODE
MOV AL, 2AH       ;Load 1st operand to AX
MOV BX, -26CH     ;Load 2nd operand in BX
IMUL BX
RET

;DIV
MOV AX, 100    ; Load AX with the dividend
MOV BX, 10     ; Load BX with the divisor
DIV BX         ; Divide AX by BX, quotient in AL and remainder in AH

;AND 
ORG 100h
AND AX,0008h

;OR
OR AX, 0098H

;NOT
MOV AX, 0x0F   ; Move the hexadecimal value 0Fh into the AX register
NOT AX         ; Perform a bitwise NOT on the contents of the AX register

;XOR
XOR AX, 0098H

;TEST
TEST AX, BX
TEST [0500], 06H
TEST [BX] [DI], CX

;SHL/SAL
SHL AX, 1

;SHR
SHR AX, 1

;JUMP
ORG 100h   ; Start of program

    ; Do some work here...
    MOV AX, 0 ; Move the value 0 into the AX register
    CMP AX, 0 ; Compare the value in AX to zero
    JNE not_zero ; Jump to not_zero if AX is not equal to zero
    ; If we get here, AX must be zero
    ; Do some more work...
    JMP end ; Jump to the end of the program
not_zero:
    ; If we get here, AX is not equal to zero
    ; Do some different work...
end:
    ; End of program
    MOV AH, 4Ch ; Set the exit code
    INT 21h    ; Exit the program
    
 
