data SEGMENT
    str DB 'sagar$'
    len DW $-str-1;
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
START:
    MOV AX, data
    MOV DS, AX
    MOV ES, AX;
    
    ; code starts from here
    
    ; to print without using 09h function, we print each character     
    
    MOV CX, len
    LEA SI, str
    
MYLOOP:
    MOV BX, [SI];
    SUB BX, 32
    MOV DX, BX
    
    
    MOV AH, 02H
    INT 21H
    INC SI
    
    LOOP MYLOOP
    
    
    
    
    HLT

code ENDS
END START
