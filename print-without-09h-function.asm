data SEGMENT
    str DB 'SAGAR$'
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
    MOV DX, [SI]
    MOV AH, 02H
    INT 21H
    INC SI
    
    LOOP MYLOOP
    
    
    
    
    HLT

code ENDS
END START
