%include "io.inc"

section .data
    aux db

section .text
global CMAIN
CMAIN:
    GET_DEC 2, eax
    GET_DEC 2, ebx
    mov [aux], eax
    add eax, ebx
    PRINT_DEC 2, eax
    NEWLINE
    sub [aux], ebx
    PRINT_DEC 2, aux
    xor eax, eax
    ret