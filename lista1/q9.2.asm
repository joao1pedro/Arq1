%include "io.inc"
section .data
    var1 db ""
    
section .text
global CMAIN
CMAIN:
    GET_DEC 2, eax
    GET_DEC 2, ebx
    
    mov [var1], eax
    add eax, ebx
    
    sub eax,[var1]
    add ebx, [var1] 
    sub ebx, eax
    
     
    PRINT_DEC 2, eax
    NEWLINE
    PRINT_DEC 2, ebx
    xor eax, eax
    ret