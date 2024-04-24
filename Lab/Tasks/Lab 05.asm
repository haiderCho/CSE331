; Program to display numbers on a LED display

    org 100h

    mov ax, 0       ; Initialize ax to 0

display_loop:
    ; Output the value of ax to the LED display
    out 199, ax

    ; Check if ax has reached 14h (20 in decimal)
    cmp ax, 14h
    je end_program

    ; Call delay subroutine
    call delay

    ; Increment ax by 1
    inc ax

    ; Jump back to the beginning of the loop
    jmp display_loop

; Subroutine to introduce delay
delay:
    mov cx, 0Fh     ; Set the delay counter

delay_loop:
    nop             ; No operation, just waste some time
    loop delay_loop ; Continue looping until cx becomes zero
    ret             ; Return from subroutine

end_program:
    hlt             ; Halt the program execution
