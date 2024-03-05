data SEGMENT
    num DW 1234H,1234H
    res DD ?
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data      
    
START:
    MOV AX, data
    MOV DS, AX             
    MOV ES, AX
    
    ; Start of the program
    
    LEA SI, num;
    MOV AX, [SI]
    MOV BX, [SI+2];
    
    MUL BX
    
    ; A lower ho so lower bit aauxa AX ma rw higher bit aauxa DX ma
    
    MOV res, AX;
    MOV res+2, DX;
    
    HLT
code ENDS
END START
