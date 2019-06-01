%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 10
    mov ebx, 9
    mov ecx, 8
    mov edx, 7
    mov esi, 6
    mov edi, 5
    
    pushad
    
    popad
    
    PRINT_DEC 4, eax
    PRINT_DEC 4, ebx
    PRINT_DEC 4, ecx
    PRINT_DEC 4, edx
    PRINT_DEC 4, esi
    PRINT_DEC 4, edi
    xor eax, eax
    ret