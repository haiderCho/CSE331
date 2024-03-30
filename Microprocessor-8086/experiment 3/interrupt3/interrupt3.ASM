;--------------------------------------------------------------------------
;
;              Build this with the "Source" menu using
;                     "Build All" option
;
;--------------------------------------------------------------------------
		DOSSEG
		.MODEL	SMALL		
		.8086				


; 8253 Port Address):
L8253T0			EQU	100H			; Timer0's port number in I/O space
L8253T1			EQU 	102H			; Timer1's port number in I/O space
L8253T2			EQU 	104H			; Timer2's port number in I/O space
L8253CS			EQU 	106H			; 8253 Control Register's port number in I/O space

; 8255 Port Address):
L8255PA			EQU	121H			; Port A's port number in I/O space
L8255PB			EQU 	123H			; Port B's port number in I/O space
L8255PC			EQU 	125H			; Port C's port number in I/O space
L8255CS			EQU 	127H			; 8255 Control Register's port number in I/O space


IRQNum			EQU	147			

Patch_Protues	EQU	IN AL, 0	;	Simulation Patch for Proteus, please ignore this line

;=======================================================================
; 宏定义
;=======================================================================

    WaitForHWInt MACRO INTNum		; INTNum is the HW INT number
		MOV AL, INTNum   			;
		OUT 0, AL					;
		STI
		CLI
    ENDM

;-----------------------------------------------------------
;	定义数据段                                             |
;-----------------------------------------------------------
		.data					
DelayShort	dw	800				
DelayLong	dw	8000			

;-----------------------------------------------------------
;	定义代码段                                             |
;-----------------------------------------------------------
		.code						; Code segment definition
		.startup					; Entrance of this program
;------------------------------------------------------------------------
		Patch_Protues					; Simulation Patch for Proteus,
								; Please ignore the above code line.
;------------------------------------------------------------------------

START:								; Modify the following codes accordingly
		MOV AX, @DATA					;
		MOV DS, AX					; Initialize DS
		
		MOV  BL, IRQNum					; BL is used as a parameter to call the procedure INT_INIT
		CALL INT_INIT					; Procedure INT_INIT is used to set up the IVT
		
		CALL INIT8253					; Initialize 8253 
		CALL INIT8255					; Initialize 8255 
		
Display_Again:	JMP Display_Again


;===================================================================================
; Attention:
; The following codes is a Patching for Proteus 8086 Hardware Simulation Bug.
; Use these codes in the case you want the 8086 to halt and waiting for HW INT only! 
; You can treat it as if it doesn't exist. 
;
; If you need to use HW INT, please uncomment it, or
; Don't modify it, leave it here just as it is.
;		WaitForHWInt IRQNum				
;====================================================================================
		JMP	Display_Again

		HLT						; 
;=====================================================================================

INIT8255 PROC
		MOV AL, 10000001B
		MOV DX, L8255CS
		OUT DX, AL
		
		MOV DX, L8255PC
		MOV AL, 01000000B
		OUT DX, AL
		RET
INIT8255 ENDP

INIT8253 PROC
		MOV DX, L8253CS
		MOV AL, 10110000B
		OUT DX, AL
		MOV AL, 00110100B
		OUT DX, AL
		CALL FEEDDOG
		
		MOV DX, L8253T0
		MOV AX, 40000
		OUT DX, AL
		MOV AL, AH
		OUT DX, AL
		
		RET
INIT8253 ENDP

FEEDDOG PROC
	        MOV DX, L8253T2
		MOV AX, 50000
		OUT DX, AL
		MOV AL, AH
		OUT DX, AL
		RET
FEEDDOG ENDP
;-------------------------------------------------------------
;                                                             |                                                            |
; Function：INTERRUPT Vector Table INIT						  |
; Input: BL = Interrupt number								  |
; Output: None			                                	  |
;                                                             |
;-------------------------------------------------------------	
INT_INIT	PROC FAR
		CLI				; Disable interrupt
		MOV CL, 2
		SHL BX, CL
		MOV AX, 0
		MOV ES, AX			; To set up the interrupt vector table
		MOV WORD PTR ES:[BX], OFFSET MYIRQ
		MOV WORD PTR ES:[BX+2], SEG MYIRQ
		STI
	        RET	
INT_INIT	ENDP

		
;--------------------------------------------------------------
;                                                             |                                                            |
; FUNCTION: INTERRUPT SERVICE  Routine （ISR）				  | 
; Input::                                                     |
; Output:                                                     |
;                                                             |
;--------------------------------------------------------------	
		
MYIRQ 	PROC FAR
	        CLI
		
		CALL FEEDDOG
		
		STI
		RET
MYIRQ 	ENDP

	.stack 100h				
	END					