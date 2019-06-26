section .bss
    out_buffer resb 4

section .text

global _start
_start:
    push 5
    push 9
    push 9
    push 3
    
    call media

media:
    push ebp
    mov ebp, esp
    mov eax, [ebp+16] ;5
    mov ebx, [ebp+12] ;9
    mov ecx, [ebp+8] ;9
    sub eax, 48
    sub ebx, 48
    sub ecx, 48
    add ebx, ecx
    add eax, ebx
    mov edi, [ebp+20] ;3
    div edi
    pop ebp
    
    add eax, 48
    mov [out_buffer], eax
    
    mov eax, 4
    mov ebx, 1
    mov ecx, out_buffer
    mov edx, 1
    int 0x80
    
exit:
    mov eax, 1
    int 0x80
