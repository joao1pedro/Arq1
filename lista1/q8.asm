%include "io.inc"
section .data
    array1 dw "Arquitetura", 0
    array2 times 0 dw 0
    
section .text
global CMAIN
CMAIN:
    ;Escreva um programa com um laço e endereçamento indireto que copie uma string da
;origem para o destino, invertendo a ordem dos caracteres no processo.
    mov ecx, 11
    mov esi, array1
    mov edi, array2
    lp:
        mov eax, [esi]
        mov [edi], eax
        add esi, 2
        add edi, 2 
    loop lp  
    
    xor eax, eax
    ret