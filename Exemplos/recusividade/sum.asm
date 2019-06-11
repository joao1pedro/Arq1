section .bss
    i resb 1
section .text
global _start

_start:
    push dword 6
    call sum
   
    add eax, 48
    mov [i], eax
    mov ecx, i
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80
sum:
    push ebp
    push ecx
    mov ebp, esp
    add ebp, 12
    mov ecx, [ebp]
    cmp ecx, 0
    jz L1
    add eax, ecx
    dec ecx
    call sum
L1:
    pop ecx
    pop ebp
    ret
