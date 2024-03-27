.model small
.stack 100h
.data
str1 db 'hello$'
str2 db 'world$'
str3 db 6 dup('$')
arr db 5 dup(?)
arr1 db 5 dup(?)
.code
proc main
mov ax, @data
mov ds, ax 

; take input
mov ah, 1 ; input -> AL
int 21h 

mov cl, al


; print tab
mov dl, 9
mov ah, 2
int 21h  


; print output
mov dl, cl ; output -> DL
mov ah, 2
int 21h 


; new line
mov dl, 10
mov ah, 2
int 21h
; Carriage Return
mov dx, 13
mov ah, 2
int 21h  


; print string 1
lea dx, str1 ; mov dx, offset str
mov ah, 9
int 21h 


; print space
mov dl, ' ' ; mov dl, 32
mov ah, 2
int 21h      


; print string 2
mov dx, offset str2 ; lea dx, str2
mov ah, 9
int 21h 


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h 


; take string3 values [input]
lea si, str3
mov cl, 0
stringInput:
mov ah, 1
int 21h
cmp al, '$'
je stop
mov [si], al
inc si
inc cl
cmp cl, 5
jnz stringInput
stop: 

; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h 


; print string 3
mov dx, offset str3
mov ah, 9
int 21h


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h   


; take array values [input]
lea si, arr
mov cl, 0
startLoop:
mov ah, 1
int 21h
sub al, 48
mov [si], al
inc si
inc cl; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h    


; take string3 values [input]
lea si, str3
mov cl, 0
stringInput:
mov ah, 1
int 21h
cmp al, '$'
je stop
mov [si], al
inc si
inc cl
cmp cl, 5
jnz stringInput
stop: 


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h      


; print string 3
mov dx, offset str3
mov ah, 9 


int 21h
; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h 


; take array values [input]
lea si, arr
mov cl, 0
startLoop:
mov ah, 1
int 21h
sub al, 48
mov [si], al
inc si
inc cl
cmp cl, 5
jnz startLoop


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h    


; print array values
lea si, arr
mov cl, 0
printArray:
mov bl, [si]
add bl, 48
mov dl, bl
mov ah, 2
int 21h
mov dl, ' '
mov ah, 2
int 21h
inc si
inc cl
cmp cl, 5
jnz printArray 


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h  


; reverse array
lea si, arr
lea di, arr1
mov cl, 0
reverseArray:
mov al, [si]
mov [di+4], al
inc si
dec di
inc cl
cmp cl, 5
jnz reverseArray 


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h  


; print array1 values (reversed array)
lea si, arr1
mov cl, 0
printArray1:
mov bl, [si]
add bl, 48
mov dl, bl
mov ah, 2
int 21h
mov dl, ' '
mov ah, 2
int 21h
inc si
inc cl
cmp cl, 5
jnz printArray1 


; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h 


; print the following pattern using nested Loop
; *
; **
; ***
; ****
; *****
mov cl, 1 ; outer Loop counter
outerLoop:
    mov ch, 0 ; inner Loop counter
    innerLoop:
        mov dl, '*' ; mov dl, 42
        mov ah, 2
        int 21h
        inc ch
        cmp ch, cl
    jnz innerLoop
; new line
mov dl, 10
mov ah, 2
int 21h
mov dl, 13
mov ah, 2
int 21h
inc cl
cmp cl, 6
jnz outerLoop


endp main
end main
