.model small 
.stack 100h
.data
.code
main proc
       ;mov al, 5h
;       mov ah, 2h  
;       cmp al, ah ; al>ah
;       jg l1
;       jle l2 
;       
;      l1:
;        mov cl, 1
;        hlt  ; end
;         
;      l2:
;        mov ch, 1
;        hlt
; 
;       ; if(al>ah):
;            ;mov cl, 1 
;            ; break
;;         else
;;            mov ch, 1  
;; break
;
;; loop  
;; for(i=1;i<5;i++) 

mov al, 1 ; i = 1  

loop1:   

    mov bl, 1
 
inc al   ; i++
cmp al, 5 ; al  
jne loop1


endp main
end main
Unconditional Jump Instructions  => jmp  
                                                                    cmp al, ah
                                
Conditional Jump Instructions   =>  jg  ; al > ah
                                    jl  ; al < ah
                                    jz / je  ; al == ah
                                    jne ; al != ah
                  
                  cmp al, ah ; al - ah
                  sub al, ah ; al = al - ah   
             
             
             mov al, 00110011b
             mov ah, 11001111b
                     
             and al, ah ;    al =00000011 
             
            
                