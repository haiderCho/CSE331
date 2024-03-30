;-----------------------------------------------------------
;74LS273  88H or 8AH or 8CH or 8EH
;-----------------------------------------------------------
.MODEL SMALL
.8086 

PortOut	EQU 88h	
INITIALSTATE EQU 0F6h 
STATE_1 EQU 0F3h
STATE_2 EQU 0F7h
STATE_3 EQU 0F5h
STATE_4 EQU 0DEh
STATE_5 EQU 0FEh
STATE_6 EQU 0EEh
ITERATION_BLINK EQU 6000h

.stack 100h
.data
.code
.startup

    MOV AL, INITIALSTATE
    OUT PortOut, AL
    MOV CX, 0
Stage1:
    LOOP Stage1
    MOV AL, STATE_1
    OUT PortOut, AL
Stage2:
    LOOP Stage2
    MOV AL, STATE_2
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage3:
    LOOP Stage3
    MOV AL, STATE_1
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage4:
    LOOP Stage4
    MOV AL, STATE_2
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage5:
    LOOP Stage5
    MOV AL, STATE_3
    OUT PortOut, AL
Stage6:
    LOOP Stage6
    MOV AL, STATE_4
    OUT PortOut, AL
Stage7:
    LOOP Stage7
    MOV AL, STATE_5
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage8:
    LOOP Stage8
    MOV AL, STATE_4
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage9:
    LOOP Stage9
    MOV AL, STATE_5
    OUT PortOut, AL
    MOV CX, ITERATION_BLINK
Stage10:
    LOOP Stage10
    MOV AL, STATE_6
    OUT PortOut, AL
    JMP Stage1
    END