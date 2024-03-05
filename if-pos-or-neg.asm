data SEGMENT
    num DB -25H
    mes1 DB 10,13,'Yes its negative$'
    mes2 DB 10,13, 'OMG its positive$'
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
START:
    MOV AX, data
    MOV DS, AX
    MOV ES, AX
    
    ; Code starts from here
    
    LEA SI, num
    MOV AX, [SI]
    
    ROL AX, 1
    
    JNC IFNOTCARRY
    LEA DX, mes2
    JMP ENDOFPROGRAM
    
IFNOTCARRY:
    LEA DX, mes1
    
ENDOFPROGRAM:
    MOV AH, 09H
    INT 21H
    HLT

code ENDS
END START
