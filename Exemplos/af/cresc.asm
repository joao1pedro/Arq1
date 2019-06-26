section .data
    newline db '',10

section .bss
    buffer resb 4

section .text
    global _start

_start:
    push 8

    call rec
    
    ;exit
    mov eax, 1
    int 0x80

rec:
    push ebp
    push ebx
    mov ebp, esp
    mov ebx, [esp+12]

    cmp ebx, 0
    je base

    dec ebx
    push ebx
    inc ebx
    call rec

    ;converte pra ASCII
    add ebx, 48
    mov [buffer], ebx

    ;print
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    ;pular linha
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    pop ebx

    jmp fim

base:
    mov eax, 0

fim:
    pop ebx
    pop ebp
    ret
