%include "io.inc"
section .data
    arrayB db 0,1,2,3,4,5,6,7,8,9
section .text
global CMAIN
CMAIN:
    mov al, [arrayB] ;coloca 0 em al
    xchg al, [arrayB+9] ;troca arrayB+9 com 0 al agora = 9 e arrayB+9 = 0
    xchg al, [arrayB]
    ; realiza a mesma ideia para todos os pares arrayB+i -> arrayB+i-1
    mov al, [arrayB+1]
    xchg al, [arrayB+8]
    xchg al, [arrayB+1]
    
    mov al, [arrayB+2]
    xchg al, [arrayB+7]
    xchg al, [arrayB+2]
    
    mov al, [arrayB+3]
    xchg al, [arrayB+6]
    xchg al, [arrayB+3]
    
    mov al, [arrayB+4]
    xchg al, [arrayB+5]
    xchg al, [arrayB+4]
    ;printa o array reordenado
    PRINT_DEC 1, [arrayB]
    NEWLINE
    PRINT_DEC 1, [arrayB+1]
    NEWLINE
    PRINT_DEC 1, [arrayB+2]
    NEWLINE
    PRINT_DEC 1, [arrayB+3]
    NEWLINE
    PRINT_DEC 1, [arrayB+4]
    NEWLINE
    PRINT_DEC 1, [arrayB+5]
    NEWLINE
    PRINT_DEC 1, [arrayB+6]
    NEWLINE
    PRINT_DEC 1, [arrayB+7]
    NEWLINE
    PRINT_DEC 1, [arrayB+8]
    NEWLINE
    PRINT_DEC 1, [arrayB+9]
    
    xor eax, eax
    ret