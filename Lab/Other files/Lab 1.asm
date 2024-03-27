org 100h
   
;Block1:
 
   mov ax,081h
   mov ah,0ech
   add al,ah 
 
;Block2:
  
   mov ax,07e6h
   mov bx,07e7h
   sub ax,bx 
;Block3:  
   mov ax,092h
   mov bx,048h
   add ax,bx 

;Block4:  
  
   mov ah,0d3h 
   mov al,051h  
   add ah,al

;Block5:  
   mov ax,04a06h 
   mov bx,02a0eh 
   add ax, bx
  
  
ret





