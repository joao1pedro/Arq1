section .data
    msg db 'Entre com seu nome: ', 0xa, 0xd
    len equ $-msg
    retDisp db 'Voce digitou: ', 0xa, 0xd
    tam equ $-retDisp

section .bss
    nome resb 2

section .text
global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ;Entrada de dados
    mov eax, 3
    mov ebx, 0
    mov ecx, nome
    mov edx, 10
    int 0x80

print:
    mov edx, tam
    mov ecx, retDisp
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, len
    mov ecx, nome
    mov ebx, 1
    mov eax, 4
    int 0x80

exit:
    mov eax, 1
    mov ebx, 5
    int 0x80
