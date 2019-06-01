%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 2, eax
    GET_DEC 2, ebx
    sub eax, ebx
    PRINT_DEC 2, eax
    xor eax, eax
    ret