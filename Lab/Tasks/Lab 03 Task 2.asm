.model small
.stack 100h

.data
    array dw 78, 10, 47, 13, 89, 65, 42, 96, 23, 39
    even_array dw 10 dup(?)
    odd_array dw 10 dup(?)
    even_count dw 0
    odd_count dw 0

.code
main:
    mov ax, @data
    mov ds, ax

    mov si, 0          ; Initialize source index
    mov di, 0          ; Initialize destination index for even array
    mov bx, 0          ; Initialize destination index for odd array

    mov cx, 10         ; Loop counter

separate_loop:
    mov ax, array[si]  ; Load number from array
    mov dx, 0          ; Clear DX for division

    mov bx, ax         ; Copy number to BX for division
    mov ax, 0          ; Clear AX for division

    mov ax, bx
    mov bx, 2
    div bx             ; Divide number by 2

    cmp ah, 0          ; Check remainder
    je is_even         ; If remainder is 0, jump to is_even

is_odd:
    mov ax, array[si]     ; Load odd number
    mov odd_array[bx], ax ; Store in odd array
    inc odd_count         ; Increment odd count
    jmp continue_loop     ; Jump to continue loop

is_even:
    mov ax, array[si]      ; Load even number
    mov even_array[di], ax ; Store in even array
    inc even_count         ; Increment even count

continue_loop:
    inc si             ; Move to next element in array
    inc di             ; Move to next index in even array
    inc bx             ; Move to next index in odd array

    loop separate_loop ; Repeat loop

    mov ah, 4Ch        ; Exit program
    int 21h

end main

