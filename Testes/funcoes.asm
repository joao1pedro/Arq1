%include "io.inc"

section .data
    myArray dd 1, 2,3,4,5
    tam equ ($-myArray)/4
    
section .bss
    res resb 1
    
section .text
global CMAIN
CMAIN:
    call soma
    PRINT_DEC 4, [res]
    xor eax, eax
    ret
    
soma:
    mov esi, 0
    mov ecx, tam
    mov eax, 0
    L1:
        add eax, [myArray]
        add esi, 4
        loop L1
    mov [res], eax
    ret