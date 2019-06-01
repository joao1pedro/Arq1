%include "io.inc"

section .bss
    n resb 1

section .text
global CMAIN
CMAIN:
    call SUM
    PRINT_DEC 1, eax
    xor eax, eax
    ret
    
SUM:
    GET_DEC 1, [n]
    mov ecx, [n]
    
    .L1:
        add eax, ecx
        loop .L1
    ret