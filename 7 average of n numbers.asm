.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 5 DUP(?)
    T1 DB "ENTER NUMBERS:$"
    T2 DB 10,13,"AVERAGE IS:$"    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH,09
    LEA DX,T1
    INT 21H

    LEA DI, ARR
    MOV CX, 5

READ_LOOP:
    MOV AH, 01
    INT 21H
    SUB AL, 30H        
    MOV [DI], AL
    INC DI
    LOOP READ_LOOP 
    
    
    MOV AH,09
    LEA DX,T2
    INT 21H

    MOV AX, 0
    LEA SI, ARR
    MOV CX, 5

SUM_LOOP:
    ADD AL, [SI]
    ADC AH, 0        
    INC SI
    LOOP SUM_LOOP

    MOV BL, 5
    DIV BL     

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN 
