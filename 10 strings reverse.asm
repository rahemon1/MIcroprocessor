.MODEL SMALL
.STACK 100H
.DATA
    STRING DB 6 DUP(?) 
    TEXT DB "ENTER A STRING: $"
    RESULT DB 10, 13, "REVERSED STRING: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX,6
    MOV SI,OFFSET STRING
    
    MOV AH,09
    LEA DX, TEXT
    INT 21H
    
    INPUT:
   
    MOV AH,01
    INT 21H
    MOV [SI],AL
    PUSH [SI]
    INC SI
    LOOP INPUT
                      
    
    MOV AH, 09
    LEA DX, RESULT
    INT 21H
    
    MOV CX,6
    MOV SI,OFFSET STRING

    OUTPUT:
    POP [SI]                     
    MOV DL, [SI]              
    MOV AH, 02
    INT 21H 
    INC SI
    LOOP OUTPUT         

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
