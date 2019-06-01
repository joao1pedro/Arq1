%include "io.inc"
section .data
    arrayS db 'A','B','C','D'
    
section .text
global CMAIN
CMAIN:
    ;Usando a instrução XCHG não mais que três vezes, reordene os quarto registradores
;   de 8 bits da ordem A,B,C,D para B,C,D,A.

    ; coloca os valores do array cuja possui os valores de entrada na ordem A , B, C, D
    ; respectivamente nos registradores ah, bh, ch, dh
    mov ah, [arrayS]
    mov bh, [arrayS+1]
    mov ch, [arrayS+2]
    mov dh, [arrayS+3]
    
    ;troca o primeiro com o ultimo e os dois do meio resultando em D, C, B, A
    xchg ah, dh
    xchg bh, ch
    
    ;printa o vetor
    PRINT_CHAR ah
    NEWLINE
    PRINT_CHAR bh
    NEWLINE
    PRINT_CHAR ch
    NEWLINE
    PRINT_CHAR dh
    NEWLINE
    
    xor eax, eax
    ret