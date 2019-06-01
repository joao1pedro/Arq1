%include "io.inc"
section .data
    arrayW dw 0,1,2,3,4,5,6,7,8,9
    
section .text
global CMAIN
CMAIN:
    mov esi, 0
    mov ecx, 10
    mov ax, [arrayW + esi]
    ;for para incrementar ponteiro esi e somar ax com valor que esi esta apontando
    sum:add esi, 2
        add ax, [arrayW + esi]
    loop sum

    PRINT_DEC 2, ax

    xor eax, eax
    ret
