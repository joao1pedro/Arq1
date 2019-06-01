%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 2, eax
    GET_DEC 2, ebx
    GET_DEC 2, ecx
    GET_DEC 2, edx
    add eax, ebx
    add ecx, edx
    sub eax, ecx
    PRINT_DEC 2, eax
    xor eax, eax
    ret