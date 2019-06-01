%include "io.inc"

section .data
    array db 1,2,3,4,5,6
    size equ $-array

section .text
global CMAIN
CMAIN:
    call SUM
    PRINT_DEC 1, eax
    xor eax, eax
    ret
    
SUM:
    mov ecx, size
    mov esi, 0
    mov eax, [array+esi]
    
    .L1:
        inc esi
        mov ebx, [array+esi]
        add eax, ebx   
        loop .L1
    ret