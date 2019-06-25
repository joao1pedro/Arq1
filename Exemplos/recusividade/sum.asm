section .bss
    string resb 1
section .text
global _start

_start:
    push 5
    call sum
    
    add eax, 48
    mov [string], eax
    
    mov ecx, string
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80
sum:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    cmp ecx, 1
    je base
    dec ecx
    call sum
    inc ecx
    add eax, ecx

base:
    mov eax, 1

    jmp end

end:
    pop ebp
    ret 4
