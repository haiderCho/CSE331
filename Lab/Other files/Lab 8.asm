.model small
.stack 100h
.data
.code    

addTwo proc
    mov ax, 5
    mov bx, 2
    add ax, bx  
    call subTwo;   push => return add => sp = sp-2 (FCh)
    ret     ; pop => return address (ip) => sp = sp + 2 
endp addTwo   

subTwo proc
    pop ax
    pop bx
    sub ax, bx   
    ret     ; pop => return address (ip) => sp = sp + 2  (FEh)
endp subTwo

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 3
    mov bx, 2
    
    push ax
    push bx
    
    call addTwo ;  push => return add => sp = sp-2  (FEh)
    
endp main
end main