%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 5 ;coloca o valor 5 em AC
    mov ebx, 3 ;coloca o valor 3 em ebx
    mul ebx ;multiplica AC por EBX
    PRINT_DEC 2, eax
    xor eax, eax
    ret