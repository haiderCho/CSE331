;-----------------------------------------------------------
;
;              Build this with the "Source" menu using
;                     "Build All" option
;
;-----------------------------------------------------------

		DOSSEG
		.MODEL	SMALL		
		.8086				

		.data					

		.code						; Code segment definition
		.startup					


        MOV AX,8000H
		MOV DS,AX                 
		MOV BX,0H
	        MOV AX,0100H
		MOV BYTE PTR [BX],0H					
L:     
		MOV WORD PTR [BX],AX	
		ADD AL,2
		ADD AH,2
		ADD BX,2
		JNZ L

WT: 
		JMP WT

		.stack 100h				


		END						
