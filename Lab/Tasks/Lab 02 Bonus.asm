.model small
.stack 100h

.data
name_array db 20 dup(?)  
index dw 0               

.code
main proc
    mov ax, @data         
    mov ds, ax

    mov si, 9004h         
    mov di, offset name_array  

read_loop:
    mov al, [si]          
    mov [di], al          
    inc si                
    inc di                

    cmp al, 0             
    jne read_loop         

    mov [di], '$'        

    ; Display the name if needed
    mov dx, offset name_array
    mov ah, 9
    int 21h

    mov ah, 4Ch           
    int 21h
main endp

end main

