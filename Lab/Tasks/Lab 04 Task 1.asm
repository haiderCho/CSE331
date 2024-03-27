.model small
.stack 100h

array db 55, 14, 9, 35, 67, 22, 10
 

search macro element
mov cx, 7
mov si, offset array
mov dx, 0 ; Flag for element found

search_loop:
    cmp byte ptr [si], element ; Compare current element with parameter
    je found ; Jump if equal

    inc si ; Increment array pointer
    loop search_loop

found:
    mov dx, element ; Set flag to 1 if found
    .endm

main proc
    push ax ; Preserve AX

    search 14 ; Call search macro

    cmp dx, 1 ; Check if element found
    je element_found

    ; Element not found (optional: handle this case)

element_found:
    mov sp, dx ; Store flag in SP (1 if found, 0 otherwise)

    pop ax     ; Restore AX

    ret ; Return
main endp

end main