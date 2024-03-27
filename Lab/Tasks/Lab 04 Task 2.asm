.model small
.stack 100h

.data
 string db "madam$"           
 
.code

palindrome proc
    mov si, dx ; String pointer
    mov di, dx ; Reverse string pointer
    mov bl, 0 ; Loop counter

palindrome_loop:
    mov al, [si] ; Get character from string
    cmp al, '$' ; Check for end of string
    je palindrome_end ; Terminate if end of string
    inc si ; Increment string pointer
    inc bl ; Increment loop counter for string length

    mov ah, 0    ; Clear upper byte of accumulator
    xchg al, ah  ; Swap characters for reverse string
    mov [di], al ; Store swapped character in reverse string
    inc di       ; Increment reverse string pointer

    jmp palindrome_loop

palindrome_end:
    cmp bl, bl     
    je even_length
    dec di         

compare_loop:
    mov al, [si] ; Get character from string
    mov ah, [di] ; Get character from reversed string
    cmp al, ah   ; Compare characters
    jne not_palindrome ; Jump if not equal

    inc si ; Increment string pointer
    dec di ; Decrement reverse string pointer
    loop compare_loop

    mov dl, 1 ; Set flag to 1 if palindrome
    ret       

not_palindrome:
    mov dl, 0 ; Set flag to 0 if not palindrome
    ret      

even_length:

    ret 
palindrome endp

main proc
    push ax ; Preserve AX

    mov dx, offset string
    call palindrome 

    cmp dl, 1 
    je is_palindrome


is_palindrome:
    mov dh, dl ; Store flag in DH (1 if palindrome,