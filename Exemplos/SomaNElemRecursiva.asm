%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_DEC 4, ecx
    call SOMA
    PRINT_DEC 4, eax
    xor eax, eax
    ret
    
SOMA:
    cmp ecx, 1
    je BASE
    dec ecx
    call SOMA
    inc ecx
    add eax, ecx
    ret

BASE:
    mov eax, 1
    ret
