include "emu8086.inc"
.model small
.stack 100h
.data    
p db 5
arr db 1,2,3
str db "hello$"
.code 



addTwo proc 
    mov al, 2
    mov ah, 3
    add al, ah   
    ret    ; (address store => stack (pop => IP) + jump)
endp addTwo

subTwo macro a, b, c ; a=p, b=str, c=arr
    mov al, a ; al = 5
    lea si, c  
    mov ah, [si+2] 
    sub al, ah ; 5-3=2 
    lea di, b
    mov bl, [di+1] ; bl = e [65]
    
endm subTwo  

main proc
    mov ax, @data
    mov ds, ax    
    
    mov ah, 1 ; input  al => 5
    int 21h 
    
    mov dl, al
    mov ah, 2 ; output  dl => 5
    int 21h 
        
    ; new line
    mov dl, 10
    mov ah, 2
    int 21h
    
    mov dl, 13
    mov ah, 2
    int 21h  
    
    lea dx, str
    mov ah, 9  ; string print
    int 21h 
    
    
    
    ;call addTwo  ; (address store => stack (push) + jump)
    ;subTwo p, str, arr  
;    
;    
;    PRINTN "hello"
;    PRINT "world"
;    
;    mov cl, 5
    
    ;int i=5
;    do{
;        a++ 
;         
;        i--
;    } while(i>=0)  
;    
;    mov al, 5  ; al = i
;    mov dl, 0 
;    l1:  
;        inc dl ;  dl = a
;    
;        dec al  ; i--
;        cmp al, 0 ;
;    jge l1 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    
    ;mov cx, 5  ; al = i
;    mov dl, 0
;    l1:  
;        inc dl ; dl = a
;    
;    loop l1
    
endp main
end main