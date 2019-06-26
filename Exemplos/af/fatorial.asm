section .bss
    buffer resb 1

section .text
    global _start

_start:
    push 3

    call fat

    add eax, 48
    mov [buffer], eax
    
    mov ecx, buffer
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80

    ;exit
    mov eax, 1
    int 0x80

fat:
    push ebp
    push ebx
    mov ebp, esp
    mov ebx, [ebp+12]

    cmp ebx, 0
    je base

    dec ebx
    push ebx
    inc ebx
    call fat
    mul ebx
    mov [buffer], ebx
    pop ebx

    jmp fim
base:
    mov eax, 1

fim:
    pop ebx
    pop ebp
    ret

