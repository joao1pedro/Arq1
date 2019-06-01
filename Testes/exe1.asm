%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 5
    add eax, 6
    PRINT_DEC 1, eax
    
    xor eax, eax
    ret