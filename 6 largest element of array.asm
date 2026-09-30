.MODEL SMALL
.STACK 100H
.DATA
ARR DB 3,5,2,8,4,9 
TEXT DB 10,13,"THE LARGEST NUMBER IS : $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5          
    LEA SI, ARR        
    MOV BL, [SI]       

LOOP1:
    INC SI
    CMP BL, [SI]        
    JGE NEXT
    MOV BL, [SI]       

NEXT:
    DEC CX
    JNZ LOOP1

    MOV AH, 09H
    LEA DX, TEXT
    INT 21H

    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H      
    INT 21H
    
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
