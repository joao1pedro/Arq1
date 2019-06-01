%include "io.inc"
section .data
    arrayB dw 73,98,12,30,5,04,23,45,55,01,22,34
    
section .text
global CMAIN
CMAIN:
    mov ecx, 12
    mov esi, arrayB+2 ;coloca o endereço de arrayB+2 em esi
    mov ax,[esi] ;coloca o valor de esi = 98 em ax
    add esi, 4 ;pega o proximo valor par
    ;for que soma ax com valor que esi está pontando
    sum:add ax, [esi] 
        add esi, 4 ;incrementa esi em 4 para pegar o prox elemento par
    loop sum
    
    mov bx, ax ; coloca a soma dos pares em bx
    
    mov ecx, 12
    mov esi, arrayB
    mov ax,[esi]
    add esi, 4 ;pega o proximo impar
    ;for que soma ax com valor que esi está pontando
    sum2:add ax, [esi] 
        add esi, 4 ;incrementa esi em 4 para pegar o prox elemento impar
    loop sum2
    
    sub bx, ax ;subtrai bx que é a soma dos pares - ax que é a soma dos impares
    
    PRINT_DEC 2, bx
    xor eax, eax
    ret
