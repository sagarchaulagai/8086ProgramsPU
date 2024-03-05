data SEGMENT
    arr DW 10,1,2,3,4,5,6,7,8,9,10;
    lar DW ?
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
START:
    MOV AX, data
    MOV DS, AX
    MOV ES, AX;
    
    ; code starts from here
    
    LEA SI, arr;
    
    MOV CX, [SI];
    INC SI
     
   
    
MYLOOP:
    MOV AX, [SI];
    
    MOV BX, [SI+2];
    
    CMP AX, BX
    JA UPDATE
    ADD SI, 2
    
    LOOP MYLOOP
    
UPDATE:
    MOV DX, AX;
    
    
    HLT
code ENDS
END START
