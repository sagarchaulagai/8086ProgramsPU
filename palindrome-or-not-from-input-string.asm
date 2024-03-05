data SEGMENT
    mes1 DB 10,13,'Enter a string$'; 
    mes2 DB 10,13,'Not palindrome $';
    mes3 DB 10,13,'Palindrome $';
    
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
    DEC DI;   // so that $ vanda mathi jawos
    ; direct CMP [SI], [DI] garna mildaina
    
    MOV AL, [SI]
    CMP [DI], AL
    
    JNE NOTPALINDROME;
    INC SI
    
    CMP SI, DI
    JL CHECK; 
    
PALINDROME:
    LEA DX, mes3;
    MOV AH, 09H
    INT 21H 
    JMP ENDOFPROGRAM
    
NOTPALINDROME:
    LEA DX, mes2;
    MOV AH, 09H
    INT 21H
    
   
ENDOFPROGRAM:
    HLT              
code ENDS
END START
