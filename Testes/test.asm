%include "io.inc"
section .bss
    array resd 50

section .text
global CMAIN
CMAIN:
    
    mov eax,0 ;init prev
    mov ebx,-1 ; initial setup
    mov edx,1   ;init current
    mov ecx,47 ; count
    mov esi, 0 ;começa esi em 0 para preencher o vetor de fib
    
    inc ecx
    pushad
    call Fib 

    PRINT_UDEC 4, eax

    popad    
    xor eax, eax
    ret
    
Fib:
    
    .L1:
        mov  eax,ebx    
        add  eax,edx    ; eax = ebx + edx

        mov [array+esi], eax ;coloca o valor de eax na posição esi do array
        add esi, 4  ;passa para o proximo elemento do array

        mov ebx,edx ;coloca o valor current em ebx
        mov edx,eax ;atualiza current para um new current
        loop .L1
    ret