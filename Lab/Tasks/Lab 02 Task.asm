.model small
.stack 100h

.data
nameArray db 'Nafiz$'  

.code
main:
    mov ax, @data           
    mov ds, ax              

    mov si, offset nameArray 
    mov di, 8004h           

copy_loop:
    mov al, [si]            
    mov [di], al            
    inc si                  
    inc di                  
    cmp al, '$'             
    jne copy_loop           

    mov ah, 4Ch     
    
    endp main
    end main