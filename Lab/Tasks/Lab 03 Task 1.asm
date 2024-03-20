.model small
.stack 100h

.data
    str db "EXPELLIARMUS$"
    count dw 0
    index dw 0

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 0          ; Initialize character count
    mov bx, 0          ; Initialize index for string traversal

count_loop:
    mov al, str[bx]    ; Load character from string
    cmp al, '$'        ; Check if end of string
    je end_count       ; If end of string, jump to end_count

    inc cx             ; Increment character count
    inc bx             ; Move to next character
    jmp count_loop     ; Repeat loop

end_count:
    mov count, cx      ; Store the count in count variable

    mov ah, 4Ch        ; Exit program
    int 21h

end main

