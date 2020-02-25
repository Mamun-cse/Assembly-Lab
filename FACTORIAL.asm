INCLUDE 'EMU8086.INC'
.MODEL SAMLL
.STACK 100H
.DATA

N DB ?
FACT DB ?

.CODE

MAIN PROC 
    PRINT 'DATA :'
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,0
    JE IS_ZERO
    
    JMP NOT_ZERO
    
    IS_ZERO:
    MOV AL,1
    
    JMP ENDFOR
    
    NOT_ZERO:
    MOV N,AL
    DEC N
    FOR:
    
    CMP N,0
    JE ENDFOR
    
    MUL N
    DEC N
    JMP FOR
    
    ENDFOR:
    MOV FACT,AL
    ADD FACT,48
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
                     
                     
    PRINT 'FACTORIAL :'
    MOV AH,2
    MOV DL,FACT
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
   
     