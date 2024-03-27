.model small
.stack 100h
.data  
; db = Define byte
; dw = Define word

; int a
a db ?  

; int a=5 
b db 3h  

; const k = 5 
k equ 5 

; int arr[] = {1,2,3} 
arr db 1h,2h,3h 
len equ $-arr ;  5-2=3 (len)

; int arr[3]
arr1 db ?,?,?  
len1 equ $-arr1

; int arr[100] 
arr2 db 100 dup(?) 
   
; string str[100] 
str db 100 dup ('$')  ; '\0' 

; string str = "hello$"
str1 db "hello$"

.code
main proc 
    mov ax, @data  
    mov ds, ax 
    
    mov al, 2
    inc al ; al=2+1=3
    dec al ; al=3-1=2 
    lea si, arr 
    mov dl, [si] ; dl = 1h
    mov dh, [si+1] ; dh = 2h
    
         
endp main         
end main
