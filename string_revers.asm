INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
STR DB 80 DUP ?
.CODE
MAIN PROC
    PRINT "ENTER THE STRING :"
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI,0
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE ENDINPUT
    
    MOV STR[SI],AL
    INC SI
    JMP INPUT
    
    ENDINPUT:
    DEC SI
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H   
    
    PRINT 'RESULT :'
    OUTPUT:
    MOV AH,2
    MOV DL,STR[SI]
    INT 21H
    DEC SI
    CMP SI,-2
    JE ENDOUTPUT
    JMP OUTPUT
    
    ENDOUTPUT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
