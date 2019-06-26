section .data
    string db "jesus", 0
    size equ $-string

section .bss
    counter resb 1

section .text

global _start
_start:
    xor eax, eax    ;eax = 0
    mov ecx, size
    mov esi, string
vogais:
    .la:
    cmp byte[esi], 'a'
    jne .le
    inc eax
    .le:
    cmp byte[esi], 'e'
    jne .li
    inc eax
    .li:
    cmp byte[esi], 'i'
    jne .lo
    inc eax
    .lo:
    cmp byte[esi], 'o'
    jne .lu
    inc eax
    .lu:
    cmp byte[esi], 'u'
    jne .L1
    inc eax

    .L1:
    inc esi
    loop vogais

    add eax, 48
    mov [counter], eax

    mov ebx, 1
    mov eax, 4
    mov edx, 1
    mov ecx, counter
    int 0x80

exit:
    mov eax, 1
    int 0x80
