ORG 100H
MOV [1317H], 0001H
MOV [7976H], 0001H

MOV AX, [1317H]
MOV BX, [7976H]

ADD AX,BX
MOV [5678H], AX

MOV AX, [1317H]
SUB AX,BX
MOV [1427H], AX

MOV AX, [1317H]
MUL BX
MOV [1248H], AX

HLT
RET