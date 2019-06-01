%include "io.inc"
section .data
    arrayB dw 0,1,2,3,4,5,6,7,8,9
    aux dw ""
    
section .text
global CMAIN
CMAIN:
    mov ax, [arrayB]
    add ax, [arrayB+2] ;0+1
    mov [aux], ax ;aux = 1
    mov ax, [aux]
    add ax, [arrayB+4]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+6]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+8]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+10]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+12]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+14]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+16]
    mov [aux], ax
    mov ax, [aux]
    add ax, [arrayB+18]
    
    PRINT_DEC 2, ax
    xor eax, eax
    ret
