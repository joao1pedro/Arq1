section .text

global _start
_start:
    push 2
    push 3
    call pot

    mov eax, 1
    int 0x80

pot:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]    ;2
    mov ebx, [ebp+12]   ;3
    cmp ebx, 1  ;n = 1?
    je base
    dec ebx
    ;push ebx
    push eax
    call pot
    pop eax
    mul ebx
    pop ebp
    ret 8

base:
    mov ebx, 1
    mul eax
    
