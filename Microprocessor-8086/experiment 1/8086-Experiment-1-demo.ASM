;-----------------------------------------------------------
;                                                          |
;               74LS244 80H or 82H or 84H or 86H           |
;               74LS273 88H or 8AH or 8CH or 8EH           |
;                                                          |
;-----------------------------------------------------------
		.MODEL	SMALL
		.8086		
PortIn	EQU	80h	
PortOut	EQU	88h
.stack 100h				
.data
	

.code
.startup					



Again:
		IN  AL,PortIn		
		NOT AL				
		OUT PortOut,AL		
		JMP Again			

		END					
