%include "io.inc"

section .text
global CMAIN
CMAIN:
    push dword 3
    call FIB
    PRINT_DEC 4, eax
    pop ebx
    xor eax, eax
    ret
    
FIB:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+8]
    cmp ebx, 0
    je BASE
    dec ebx 
    push ebx 
    call FIB
    pop ebx 
    mov eax, ebx
    inc ebx
    add eax, ebx
    pop ebp
    ret
    
BASE:
    mov eax, 1
    pop ebp
    ret