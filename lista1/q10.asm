%include "io.inc"
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
    L1:
        add eax, [base] 
        dec dword [expoente]
        mov ecx, [expoente]
    loop L1

    PRINT_DEC 2, eax
    xor eax, eax
    ret