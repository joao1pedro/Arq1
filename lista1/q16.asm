%include "io.inc"
section .data
    array dd 10, 20, 30, 40
    ;Por exemplo, o array [10,20,30,40] será transformado em [40,10,20,30]
    
section .text
global CMAIN
CMAIN:
    mov esi, 0
    mov edi, 4
    mov ecx, 4
    lp:
        
    loop lp
    
    PRINT_DEC 4, array
    NEWLINE
    PRINT_DEC 4, array+4
    NEWLINE
    PRINT_DEC 4, array+8
    NEWLINE
    PRINT_DEC 4, array+12
    
    xor eax, eax
    ret
