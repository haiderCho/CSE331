.model small
.stack 100h

.data 

arr1 db 12,25,24,10,78  
len1 equ $-arr1

arr2 db 10,45,7,14,56
len2 equ $-arr2

arr3 db 10 dup(?) 
                                                          
                                                          
.code
main proc
    
    mov ax, @data
    mov ds,ax
    
    
    lea di, arr1
    lea si, arr2
    lea bp, arr3
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al
    inc di
    inc bp
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al
    inc di
    inc bp
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al
    inc di
    inc bp
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al
    inc di
    inc bp
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al
    inc di
    inc bp
    
    mov al,[si]
    mov [bp],al
    inc si
    inc bp


    mov al,[di]
    mov [bp],al              
    
endp main
end main