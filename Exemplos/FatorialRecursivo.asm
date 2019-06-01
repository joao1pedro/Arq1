%include "io.inc"

section .text
global CMAIN
CMAIN:
    push dword 5
    call FAT
    PRINT_DEC 4, eax
    pop ebx
    xor eax, eax
    ret
    
FAT:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+8]
    cmp ebx, 0
    je BASE
    dec ebx
    push ebx
    call FAT
    pop ebx
    inc ebx
    mul ebx
    pop ebp
    ret
    
BASE:
    mov eax, 1
    pop ebp
    ret