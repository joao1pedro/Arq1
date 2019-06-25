section .data
    string db "teste",0
    size equ ($-string-1)

section .bss
    inverter resb 64

section .text
    
global _start
_start:
    
    mov esi, 0
    mov ecx, size
    .L1:
    mov eax, [string+esi]
    push eax
    inc esi
    loop .L1

    mov ecx, size
    mov esi, 0
    .L2:
    pop eax
    mov [inverter+esi], eax
    inc esi
    loop .L2

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, inverter
    mov edx, size
    int 0x80

exit:
    mov eax, 1
    int 0x80
