ORG 100h 
MOV AX, 1C2BH       ;Set AX to 1C2B    
PUSH AX             ;Set SP=SP-2
                    ;Push AX data to stack location DS:SP
MOV BX, 302AH       ;Set BX to 302A
PUSH BX             ;SP=SP-2
                    ;Push BX data to stack location DS:SP
RET  