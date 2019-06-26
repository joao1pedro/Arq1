section .data
    msg db "Digite um numero: ",0
    size equ $-msg

section .bss
    buffer resb 4

section .text
    global _start

_start:
    ;print msg
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, size
    int 0x80

    ;input
    mov eax, 3
    mov ecx, buffer
    int 0x80

    mov al, byte[buffer]
    sub al, 48
    ;add eax, 48

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 4
    int 0x80

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
