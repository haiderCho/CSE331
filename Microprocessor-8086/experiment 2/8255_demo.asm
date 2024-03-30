;-----------------------------------------------------------
;
;              Build this with the "Source" menu using
;                     "Build All" option
;
;-----------------------------------------------------------

		DOSSEG
		.MODEL	SMALL		; Small model
		.8086			                                               |
;-----------------------------------------------------------

PortA	EQU	91H			; Port A's port number in I/O space
PortB	EQU 	93H			; Port B's port number in I/O space
PortC	EQU 	95H			; Port C's port number in I/O space
CtrlPT	EQU 	97H			; 8255 Control Register's port number in I/O space
;
Patch_Protues	EQU		IN AL, 0	;	Simulation Patch for Proteus, please ignore this line


;-----------------------------------------------------------

		.data					

DelayShort	dw	400   			; 
DelayLong	dw	40000			;


DISCHAR DB 01,02,03,04

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
		.startup					; 
;------------------------------------------------------------------------
		Patch_Protues				; Simulation Patch for Proteus,
							; Please ignore the above code line.
;------------------------------------------------------------------------


; Init 8255 in Mode 0
; PortA Output, PortB Output
;
		MOV AL,10001001B
		OUT CtrlPT,AL	;

L1: 
                IN AL, PortC
		MOV AH, AL
		MOV BL, AL
		AND BL, 0FH
		AND AL, 0F0H
		MOV CH, AL
		OR AL, 5H
		OUT PortA, AL
		MOV AL, SEGTAB[BX]
		OUT PortB, AL
		CALL DELAY
		MOV AL, CH
		OR AL, 0AH
		OUT PortA, AL
		MOV CL, 4
		SHR AX, CL
		MOV BL, AH
		MOV AL, SEGTAB[BX]
		OUT PortB, AL
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