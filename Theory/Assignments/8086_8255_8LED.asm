.model small
.stack 100h

.data

.code
    org 0000h           ; Origin at 0000h

l1:
    ; Output 11111111b to port 00h
    mov al, 11111111b
    out 00h, al
    call delay

    ; Output 11110000b to port 00h
    mov al, 11110000b
    out 00h, al
    call delay

    ; Output 00001111b to port 00h
    mov al, 00001111b
    out 00h, al
    call delay

    jmp l1              ; Jump back to l1

delay:
    ; Initialize CX register with 1111111111111111b
    mov cx, 1111111111111111b

timer1:
    nop                 ; No operation
    nop
    nop
    nop
    loop timer1         ; Loop until CX reaches zero
    ret                 ; Return from delay subroutine

end


