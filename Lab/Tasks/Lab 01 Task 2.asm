.model small
.stack 100h

.data 
                                                           
                                                          
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, 000h
    mov ax, 5FA2H
    mov bx, 2D3H
    div bx
    
    
    mov ax, 7723H
    mov dx, 21FAH 
    mul bx
    
    
endp main
end main
                           
                         