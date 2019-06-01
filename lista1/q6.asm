%include "io.inc"
section .data
    array db ""

section .text
global CMAIN
CMAIN:
    GET_DEC 2, ebx
    inc ebx
    mov [array], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+4], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+8], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+12], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+16], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+20], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+24], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+28], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+32], ebx
    GET_DEC 2, ebx
    inc ebx
    mov [array+36], ebx
    
    PRINT_DEC 2, [array]
    NEWLINE
    PRINT_DEC 2, [array+4]
    NEWLINE
    PRINT_DEC 2, [array+8]
    NEWLINE
    PRINT_DEC 2, [array+12]
    NEWLINE
    PRINT_DEC 2, [array+16]
    NEWLINE
    PRINT_DEC 2, [array+20]
    NEWLINE
    PRINT_DEC 2, [array+24]
    NEWLINE
    PRINT_DEC 2, [array+28]
    NEWLINE
    PRINT_DEC 2, [array+32]
    NEWLINE
    PRINT_DEC 2, [array+36]
    xor eax, eax
    ret