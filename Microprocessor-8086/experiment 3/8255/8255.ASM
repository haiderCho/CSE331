		DOSSEG
		.MODEL	SMALL		
		.8086	
; 8255 Port number:
; 8255 Port Address):
PortA			EQU	121H			; Port A's port number in I/O space
PortB			EQU 	123H			; Port B's port number in I/O space
PortC			EQU 	125H			; Port C's port number in I/O space
CtrlPT			EQU 	127H			; 8255 Control Register's port number in I/O space

Patch_Protues	EQU		IN AL, 0	;	Simulation Patch for Proteus, please ignore this line
;-----------------------------------------------------------
		.data					

DelayShort	dw	260			
DelayLong	dw	40000			
; SEGTAB
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
;	¶¨Òå´úÂë¶Î                                             |
;-----------------------------------------------------------
	.code					; Code segment definition
	.startup				
;------------------------------------------------------------------------
	Patch_Protues				; Simulation Patch for Proteus,
						; Please ignore the above code line.
	MOV AL, 10000001B
	MOV DX, CtrlPT
	OUT DX, AL
L1: 
        MOV DX, PortC
        IN AL, DX
	MOV AH, AL
	AND AH, 10110000B
	AND AL, 1
	MOV CL, 6
	SHL AL, CL
	OR AL, AH
	MOV DX, PortC
	OUT DX, AL
	
	MOV AL, SEGTAB[0]
	MOV DX, PortB
	OUT DX, AL
	MOV AL, 00001110B
	MOV DX, PortA
	OUT DX, AL
	CALL DELAY
	
	MOV AL, SEGTAB[3]
	MOV DX, PortB
	OUT DX, AL
	MOV AL, 00001001B
	MOV DX, PortA
	OUT DX, AL
	CALL DELAY
	
	MOV AL, SEGTAB[9]
	MOV DX, PortB
	OUT DX, AL
	MOV AL, 00000111B
	MOV DX, PortA
	OUT DX, AL
	CALL DELAY
	
	JMP L1

RET
;--------------------------------------------
;                                           |
; Delay system running for a while          |
; CX : contains time para.                  |
;                                           |
;--------------------------------------------

DELAY1 	PROC
    	PUSH CX
    	MOV CX,DelayLong	;
D0: 	LOOP D0
    	POP CX
    	RET
DELAY1 	ENDP


;--------------------------------------------
;                                           |
; Delay system running for a while          |
;                                           |
;--------------------------------------------

DELAY 	PROC
    	PUSH CX
    	MOV CX,DelayShort
D1: 	LOOP D1
    	POP CX
    	RET
DELAY 	ENDP

;-----------------------------------------------------------
		.stack 100h				
		END					