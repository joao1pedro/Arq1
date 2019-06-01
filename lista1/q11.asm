%include "io.inc"
section .data
    p dw 0
section .bss
    base RESB 2
    expoente RESB 2
    
section .text
global CMAIN
CMAIN:
    GET_DEC 2, base
    GET_DEC 2, expoente
    
    mov ecx,[expoente]
    mov eax, [base]

    pow:
        mul dword [base]
        mov [p], eax
        dec dword [expoente]
        mov ecx, [expoente]
    loop pow

    PRINT_DEC 2, [p]
    xor eax, eax
    ret