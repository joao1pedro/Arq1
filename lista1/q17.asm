%include "io.inc"
section .data
    fib times 4 dw 0
section .bss
    counter RESB 2
    
section .text
global CMAIN
CMAIN:
    GET_DEC 2, [counter]
    
    mov eax,0 ;init prev
    mov ebx,-1 ; initial setup
    mov edx,1   ;init current
    mov ecx,[counter] ; count
    mov esi, 0 ;começa esi em 0 para preencher o vetor de fib
    
L1:
    mov  eax,ebx    
    add  eax,edx    ; eax = ebx + edx

    mov [fib+esi], eax ;coloca o valor de eax na posição esi do array
    add esi, 2  ;passa para o proximo elemento do array

    mov ebx,edx ;coloca o valor current em ebx
    mov edx,eax ;atualiza current para um new current
    loop L1
    
    PRINT_DEC 2, fib
    NEWLINE
    PRINT_DEC 2, fib+2
    NEWLINE
    PRINT_DEC 2, fib+4
    NEWLINE
    PRINT_DEC 2, fib+6
    NEWLINE
    PRINT_DEC 2, fib+8
    NEWLINE
    PRINT_DEC 2, fib+10
    NEWLINE
    PRINT_DEC 2, fib+12
    NEWLINE
    xor eax, eax
    ret