%include "io.inc"

section .text
global CMAIN
CMAIN:

    
    mov bl, 112
    and bl, 72h
    jnz L1
    jz L2
    L1:
        PRINT_DEC 1, 1
    
    L2:
        PRINT_DEC 1, 0
        
    xor eax, eax
    ret