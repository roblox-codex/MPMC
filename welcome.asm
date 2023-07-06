ORG 0x0000    ; Start at address 0x0000

MOV SP, #0x07  ; Initialize Stack Pointer

MOV TMOD, #0x20 ; Timer 1, Mode 2 (8-bit auto-reload)
MOV TH1, #0xFD  ; Load TH1 with 0xFD for 9600 baud rate
MOV SCON, #0x50 ; Enable UART, 8-bit data, 1 stop bit, REN = 1
SETB TR1        ; Start Timer 1

MAIN:
    MOV DPTR, #MESSAGE  ; Load DPTR with address of MESSAGE string
    CALL SEND_STRING    ; Call subroutine to send the string

LOOP:
    SJMP LOOP          ; Infinite loop

SEND_STRING:
    MOV A, #0x00       ; Initialize index register
SEND_LOOP:
    MOVX A, @DPTR      ; Load character from DPTR
    INC DPTR           ; Increment DPTR
    JZ SEND_EXIT       ; If character is zero, exit subroutine
    CALL SEND_CHAR     ; Call subroutine to send character
    SJMP SEND_LOOP     ; Repeat loop

SEND_CHAR:
    MOV SBUF, A        ; Load character into SBUF
WAIT_FOR_TX:
    JNB TI, WAIT_FOR_TX ; Wait for transmit complete
    CLR TI             ; Clear transmit interrupt flag
    RET                ; Return from subroutine

SEND_EXIT:
    RET                ; Return from subroutine

MESSAGE:
    DB "WELCOME TO NFSU", 0  ; Null-terminated string

END
