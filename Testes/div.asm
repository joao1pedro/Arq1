%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;edx:eax
    mov edx, 0 ;tem de zerar edx
    mov eax, 10 ;coloca 10 em eax
    mov ecx, 2 ;coloca 2 em eax
    div ecx ;divide eax por ecx
    PRINT_DEC 2, eax
    xor eax, eax
    ret