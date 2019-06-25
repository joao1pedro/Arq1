section .bss
    string resb 1

section .text

global _start
_start:
    push 5
    push 3
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
    mov eax, [ebp+8]
    add eax, [ebp+12]
    jmp end
end:
    pop ebp
    ret 8
