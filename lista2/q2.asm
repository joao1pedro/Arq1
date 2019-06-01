%include "io.inc"

section .data
    pi dq 3.14
    const dw 4

section .text
global CMAIN
CMAIN:
    call ESFERA
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret

ESFERA:

    mov eax, 2
    mul eax
    mul dword[const]
    fmul qword[pi]

    ret
    