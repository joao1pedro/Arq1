%include "io.inc"
section .data
    arrayB db 0,1,2,3,4,5,6,7,8,9

section .text
global CMAIN
CMAIN:
    mov ecx, 10
    mov esi, arrayB ;coloca o endereço de arrayB em esi
    mov ax,[esi] ;coloca o valor de esi em ax
    add esi,1 ;esi++ -> prox elemento do vetor
    ;for que soma ax com valor que esi está pontando
    sum:add ax, [esi] 
        add esi, 1 ;incrementa esi em 1 para pegar o prox elemento
    loop sum
    
    PRINT_DEC 1, ax
 
    xor eax, eax
    ret
