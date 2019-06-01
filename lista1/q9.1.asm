%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 2, eax
    GET_DEC 2, ebx
    xchg eax, ebx
    PRINT_DEC 2, eax
    NEWLINE
    PRINT_DEC 2, ebx
    xor eax, eax
    ret