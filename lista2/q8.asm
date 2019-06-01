%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ecx, 10
    mov eax, ecx
    call FAT
    PRINT_DEC 4, eax
    xor eax, eax
    ret
    
FAT:
    dec ecx
    mul ecx
    cmp ecx, 1
    ja FAT
    ret
    