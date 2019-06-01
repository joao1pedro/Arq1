%include "io.inc"
section .data
    arrayW dw 10, 8, 1, 3, 5, 9, 7, 7, 0, 2
    arrayD times 10 dd 0 
section .text
global CMAIN
CMAIN:
    ;Escreva um programa que usa um laço para copiar os elementos de um array unsigned
;Word (16-bit) em um array unsigned doubleword (32-bit).
    mov esi, arrayW     ;ponteiro para arrayW
    mov edi, arrayD     ;ponteiro para arrayD
    mov ecx, 10           ; largura do array
    repeat:       
        mov eax, [esi]
        mov [edi], eax
        xchg eax, [edi]
        add esi, 2
        add edi, 4
    loop repeat    
    
    mov esi, 0
    mov edi, 36
    mov ecx, 5
    lp:
        mov eax, [arrayD+esi] ;coloca posicao 0 em eax
        xchg eax, [arrayD+edi] ;troca eax com edi -> primeira posição com ultima
        xchg eax, [arrayD+esi] ;troca eax com esi -> 
        add esi, 4
        sub edi, 4
    loop lp
    
    PRINT_DEC 2, [arrayD]
    NEWLINE
    PRINT_DEC 2, [arrayD+4]
    NEWLINE
    PRINT_DEC 2, [arrayD+8]
    NEWLINE
    PRINT_DEC 2, [arrayD+12]
    NEWLINE
    PRINT_DEC 2, [arrayD+16]
    NEWLINE
    PRINT_DEC 2, [arrayD+20]
    NEWLINE
    PRINT_DEC 2, [arrayD+24]
    NEWLINE
    PRINT_DEC 2, [arrayD+28]
    NEWLINE
    PRINT_DEC 2, [arrayD+32]
    NEWLINE
    PRINT_DEC 2, [arrayD+36]
    
    xor eax, eax
    ret