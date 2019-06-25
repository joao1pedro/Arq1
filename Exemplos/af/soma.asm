section .data
    msg1 db "Digite um número: "
    len1 equ $-msg1
    msg2 db "Digite outro número: "
    len2 equ $-msg2
    msgRes db "Resultado: "
    len_res equ $-msgRes

section .bss
    num1 resb 4
    num2 resb 4
    res resb 4

section .text
global _start

_start:

    ;mostra mensagem na tela
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ;pegando valor 1
    mov eax, 3  ;receber valor
    mov ebx, 2  ;input
    mov edx, 1
    mov ecx, num1
    int 0x80

    ;segunda mensagem
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ;input valor 2
    mov eax, 3
    mov ebx, 2
    mov ecx, num2
    mov edx, 1
    int 0x80

    ;result
    mov eax, 4
    mov ebx, 1
    mov ecx, msgRes
    mov edx, len_res
    int 0x80

    ;realizando soma
    mov bl, [num1]
    mov al, [num2]

    sub bl, '0' ;converter char em ASCII

    add al, bl  ;soma
    mov [res], al

    ;resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ;exit
    mov eax, 1
    int 0x80
