;--------------------------------------------------------------------------
;
;              Build this with the "Source" menu using
;                     "Build All" option
;
;--------------------------------------------------------------------------
		DOSSEG
		.MODEL	SMALL		
		.8086				

	.stack 100h				
; 8253 (Port Address):
L8253T0			EQU	100H			; Timer0's port number in I/O space
L8253T1			EQU 	102H			; Timer1's port number in I/O space
L8253T2			EQU 	104H			; Timer2's port number in I/O space
L8253CS			EQU 	106H			; 8253 Control Register's port number in I/O space

; 8255Ð¾Æ¬¶Ë¿ÚµØÖ· £¨Port Address):
L8255PA			EQU	121H			; Port A's port number in I/O space
L8255PB			EQU 	123H			; Port B's port number in I/O space
L8255PC			EQU 	125H			; Port C's port number in I/O space
L8255CS			EQU 	127H			; 8255 Control Register's port number in I/O space


IRQNum			EQU	147			
Patch_Protues	EQU	IN AL, 0	;	Simulation Patch for Proteus, please ignore this line

    WaitForHWInt MACRO INTNum		; INTNum is the HW INT number
		MOV AL, INTNum   			;
		OUT 0,AL					;
		STI
		CLI
    ENDM

		.data					
DelayShort	dw	400					
DelayLong	dw	4000			
	SEGTAB  DB 3FH	; 7-Segment Tube
		DB 06H	;
		DB 5BH	;            a a a
		DB 4FH	;         f         b
		DB 66H	;         f         b
		DB 6DH	;         f         b
		DB 7DH	;            g g g 
		DB 07H	;         e         c
		DB 7FH	;         e         c
		DB 6FH	;         e         c
        	DB 77H	;            d d d     h h h
		DB 7CH	; ----------------------------------
		DB 39H	;       b7 b6 b5 b4 b3 b2 b1 b0
		DB 5EH	;       DP  g  f  e  d  c  b  a
		DB 79H	;
		DB 71H	;

;-----------------------------------------------------------
		.code						; Code segment definition
		.startup					; Entrance of this program
;------------------------------------------------------------------------
		Patch_Protues					; Simulation Patch for Proteus,
								; Please ignore the above code line.
;------------------------------------------------------------------------

START:	
		MOV AL, 10000001B
		MOV DX, L8255CS
		OUT DX, AL
		
		MOV DX, L8253CS
		MOV AL, 00110110B
		OUT DX, AL
		MOV AL, 01010110B
		OUT DX, AL
		MOV AL, 10110110B
		OUT DX, AL
		
		MOV AX, 10000
		MOV DX, L8253T0
		OUT DX, AL
		MOV AL, AH
		OUT DX, AL
		
		MOV AL, 100
		MOV DX, L8253T1
		OUT DX, AL
		
		MOV AX, 10000
		MOV DX, L8253T2
		OUT DX, AL
		MOV AL, AH
		OUT DX, AL
		
		MOV CL, 4
	        MOV DX, L8255PC
L1:
		IN AL, DX
		SHL AL, CL
		OUT DX, AL
		JMP L1
		
;--------------------------------------------------------------
;                                                             |                                                            |
; Function£ºDELAY FUNCTION                                    | 
; Input£ºNone												  |
; Output: None                                                |
;--------------------------------------------------------------

DELAY 	PROC
    	PUSH CX
    	MOV CX, DelayShort
D1: 	LOOP D1
    	POP CX
    	RET
DELAY 	ENDP				

		.stack 100h				
		END