data SEGMENT
    Source DB 10, 1,2,3,4,5,6,7,8,9,10;
    Destination DB DUP(0);
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data      
    
START:
    MOV AX, data
    MOV DS, AX             
    MOV ES, AX
    
    ; Start of the program
    
    LEA SI, Source
    LEA DI, Destination
    
    MOV CL, [SI]
    MOV CH, 00H
    INC SI
    CLD
    REP MOVSB
    HLT
code ENDS
END START
    
    
    
