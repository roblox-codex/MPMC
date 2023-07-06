ORG 0x0000  ; Start at address 0x0000

MOV SP, #0x07  ; Initialize Stack Pointer

CLR P2.0    ; Set P2.0 as output pin

MAIN:
    MOV TH0, #0xFF  ; Load Timer 0 high byte with initial value for desired frequency
    MOV TL0, #0xFF  ; Load Timer 0 low byte with initial value for desired frequency

    SETB TR0  ; Start Timer 0

LOOP:
    JNB TF0, LOOP  ; Wait for Timer 0 overflow

    CLR TF0  ; Clear Timer 0 overflow flag

    CPL P2.0  ; Toggle P2.0 (Generate square wave)

    SJMP LOOP  ; Repeat loop

END
