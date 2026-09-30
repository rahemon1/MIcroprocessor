.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 10,13,"You pressed: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 01
    INT 21H
    MOV BL,AL
    
    CMP BL, 'y'
    JE SHOW
    CMP BL, 'Y'
    JE SHOW

    JMP EXIT

SHOW:
    MOV AH, 09
    LEA DX, MSG
    INT 21H 
    MOV AH,02
    MOV DL,BL
    INT 21H

    EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
