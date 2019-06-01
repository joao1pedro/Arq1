section .data
    msg db 'Hello, World!', 0xa     ;string a ser escrita
    len equ $-msg       ;tamanho da string

section .text
global _start

_start:
    mov edx, len    ;comprimento da mensagem
    mov ecx, msg    ;mensagem a ser escrita
    mov ebx, 1      ;descritor de arquivo (stdout)
    mov eax, 4      ;numero de chamada de sistema (sys_write)
    int 0x80        ;call kernel

    mov eax,1       ;numero de chamada de sistema (sys_exit)
    int 0x80        ;call kernel

    ret
