.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
    LF EQU 0AH  
    I DW ?
    FLAG DB 0
    NEWLINE DB CR, LF, '$' 
.CODE
    MAIN PROC  
        ;Initialize Data Segment
        MOV AX, @DATA
        MOV DS, AX
        
        
        END:
        ;RETURN 0
        MOV AH, 4CH
        INT 21H
    MAIN ENDP 
    
    PRINT_NEWLINE PROC
        LEA DX, NEWLINE ;Print New line
        MOV AH, 9
        INT 21H
        RET
    PRINT_NEWLINE ENDP
    
    ;Function that takes an integer as an input
    ;and saves it in DX
    ;Changes the value of registers AX, BX, DX
    INPUT_INTEGER PROC   
        XOR DX, DX  ;Initialize DX to 0
        MOV I, 0    ;Calculates number of digits
        INPUT_LOOP:
            ;Take character input
            MOV AH, 1
            INT 21H
            ;If AL == CR || AL == LF then jump to end of loop
            CMP AL, CR
            JE END_INPUT_LOOP
            CMP AL, LF
            JE END_INPUT_LOOP
            ;elif(AL == '-') then FLAG = 1
            CMP AL, '-'
            JNE DIGIT_INPUT     ;else the input is a digit
            ;else if I > 0 and AL == '-' then end the program
            CMP I, 0
            JNE END
            MOV FLAG, 1
            INC I
            JMP INPUT_LOOP
            ;Fast convert character to digit, also clears AH
            DIGIT_INPUT:
            AND AX, 000FH
            MOV BX, AX          ;Save AX in BX
            ;DX = DX * 10 + BX
            MOV AX, 10          ;AX = 10
            MUL DX              ;AX = AX * CX //// THOUGH MUL CHANGES DX, IT DOESN'T AFFECT OUT CALCULATIONS
            ADD AX, BX          ;AX = AX + BX
            MOV DX, AX          ;Stores the final value
            INC I
            JMP INPUT_LOOP            
        END_INPUT_LOOP:
        CMP FLAG, 1
        JNE END_INPUT
        NEG DX                  ;else make DX negative
        MOV FLAG, 0             ;make flag 0 again
        END_INPUT:
        RET
    INPUT_INTEGER ENDP

    ;Prints the number stored in BX
    PRINT_INTEGER PROC
        ;if(BX < -1) then the number is positive
        CMP BX, 0
        JGE POSITIVE        
        ;else, the number is negative
        MOV AH, 2           
        MOV DL, '-'         ;Print a '-' sign
        INT 21H
        NEG BX              ;make BX positive

        POSITIVE:
        MOV AX, BX
        MOV I, 0        ;Initialize character count
        PUSH_WHILE:
            XOR DX, DX  ;clear DX
            MOV BX, 10  ;BX has the divisor //// AX has the dividend
            DIV BX
            ;quotient is in AX and remainder is in DX
            PUSH DX     ;Division by 10 will have a remainder less than 8 bits
            INC I       ;I++
            ;if(AX == 0) then break the loop
            CMP AX, 0
            JE END_PUSH_WHILE
            ;else continue
            JMP PUSH_WHILE
        END_PUSH_WHILE:
        MOV AH, 2
        POP_WHILE:
            POP DX      ;Division by 10 will have a remainder less than 8 bits
            ADD DL, '0'
            INT 21H     ;So DL will have the desired character

            DEC I       ;I--
            ;if(I <= 0) then end loop
            CMP I, 0
            JLE END_POP_WHILE
            ;else continue
            JMP POP_WHILE
        END_POP_WHILE:
        RET
    PRINT_INTEGER ENDP
END MAIN