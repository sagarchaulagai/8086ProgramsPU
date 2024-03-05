data SEGMENT
    mes1 DB 10,13,'Enter a string$'; 
    
    
    str DB 50 DUP(0);
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data
    
START:
    MOV AX, data
    MOV DS, AX
    MOV ES, AX;
    
    ; code starts from here
    
    ; for user input the string
    
    LEA SI, str  
    LEA DI, str;
    
MYLOOP:
    MOV AH, 01H;
    INT 21H;  
    
    ; and the value entered goes to AL so
    ; first I have to check if enter is pressed or not
    
    CMP AL, 0DH; // 0DH is ascii of enter
    JE TERMINATE ; so if ENTER is pressed then terminate by moving $ to [DI]
    
    MOV [DI], AL; 
    INC DI
    
    JMP MYLOOP

TERMINATE:
    MOV [DI], '$';
    
CHECK:
    DEC DI;
    CMP SI, DI
    MOV DX, [DI];
    MOV AH, 02H;
    INT 21H
    
    JNZ CHECK;
    
    HLT
code ENDS
END START
