%include "io.inc"

section .bss
    var1 resd 4
    var2 resd 4
    var3 resd 4
    p1 resd 4
    p2 resd 4
    p3 resd 4

section .text
global CMAIN
CMAIN:
    
    call MEDIA
    ;PRINT_DEC 4, eax
    xor eax, eax
    ret
    
MEDIA:
    GET_DEC 4, [var1]
    GET_DEC 4, [var2]
    GET_DEC 4, [var3]
    mov dword[p1], 8
    mov dword[p2], 8
    mov dword[p3], 2
    mov edx, 0
    
    mov eax, dword[var1]
    mul dword[p1]
    mov ebx, eax
    mov eax, dword[var2]
    mul dword[p2]
    add eax, ebx
    mov ebx, eax
    mov eax, dword[var3]
    mul dword[p3]
    add eax, ebx
    mov eax, ebx

    
    mov ecx, dword[p1]
    add ecx, dword[p2]
    add ecx, dword[p3]
    
    div ecx
    
    PRINT_DEC 4, eax
    
    ret