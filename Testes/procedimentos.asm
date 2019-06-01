%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov eax, 1
    mov ebx, 2
    mov ecx, 3
    
    call soma
    PRINT_DEC 4, eax
    xor eax, eax
    ret
    
soma:
    add ebx, ecx
    add eax, ebx
    ret