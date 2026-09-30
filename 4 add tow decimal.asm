.MODEL SMALL
.STACK 100H
.DATA 
    T1 DB "ENTER TWO NUMBER:$"
    T2 DB 10,13,"SUM IS:$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09
    LEA DX,T1
    INT 21H
    
    MOV AH,01
    INT 21H
    SUB AL,30H
    MOV BL,AL
    INT 21H
    SUB AL,30H
    MOV BH,AL
    
    ADD BL,BH
    ADD BL,30H 
    
    MOV AH,09
    LEA DX,T2
    INT 21H
    
    MOV AH,02
    MOV DL,BL
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
