;Based Indexed Relative Addressing Modes

org 100H

MOV AX, [BX][SI]+5H;
MOV AX, [BP][DI]+5H;

HLT
