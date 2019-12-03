.MODEL SMALL
.STACK 100H

.DATA
MSG DB 'PLEASE ENTER THE STRING :', '$S'
X DB 80 DUP <?>
.CODE 
MAIN PROC
    MOV AX ,@DATA
    MOV DS ,AX
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    MOV SI , 0
    MOV AH,1
    NEXT:
    INT 21H
    CMP AL,0DH
    JZ EXIT
    MOV X[SI],AL
    CMP X[SI],'a'
    JGE LOWER 
    JL UPPER
        LOWER:
            CMP X[SI],'z'
               
            SUB  X[SI], 20H
            INC SI
            JMP NEXT
        UPPER:
             ADD X[SI],20H
             INC SI
             JMP NEXT
    JMP NEXT
    EXIT:
    DEC SI
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL ,0AH
    INT 21H
    NEXT2:
    MOV AH,2
    MOV DL, X[SI]
    INT 21H
    CMP SI,0
    JZ EXIT2
    DEC SI
    JMP NEXT2 
    
    EXIT2: