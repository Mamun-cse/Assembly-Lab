INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
    STR DB 80 DUP ?
    N DB ?

.CODE
    MAIN PROC
        
    PRINT "Enter The String : "
    
    MOV N,0
    MOV SI,100
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE ENDINPUT
    
    IF:
    CMP AL,65
    JL ELSEIF
    CMP AL,90
    JG ELSEIF
    
    ADD AL,32
    JMP ELSE
    
    ELSEIF:
    
    CMP AL,97
    JL ELSE
    CMP AL,122
    JG ELSE
    
    SUB AL,32
    
    ELSE:
    
    MOV STR[SI],AL
    
    INC SI
    INC N
    JMP INPUT
    
    ENDINPUT:
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    PRINT 'RESULT :'
    
    MOV SI,100
    
    OUTPUT:
    
    MOV AH,2
    MOV DL,STR[SI]
    
    INT 21H
    DEC N
    
    CMP N,0
    JE ENDOUTPUT
    INC SI
    JMP OUTPUT
    
    ENDOUTPUT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
    
    
    