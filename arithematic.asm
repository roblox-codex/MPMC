org 100h

MOV AX, 0FFF0H;
MOV BX, 0001H;
MOV [1256H],AX;
MOV [8976H],BX;

ADD AX,BX;
MOV [2345], AX;

SUB AX,BX;
MOV [2347], AX;

MUL BX;
MOV [2349], AX;

HLT

ret