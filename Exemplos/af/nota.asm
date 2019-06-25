section .bss
    out_buffer resb 4

section .text

global _start
_start:
    push dword 5
    push dword 9
    push dword 9
    push dword 3
    
    call media
media:
    push ebp
    mov ebp, esp
    mov eax, [ebp+16] ;5
    mov ebx, [ebp+12] ;9
    mov ecx, [ebp+8] ;9
    add ebx, ecx
    add eax, ebx
    mov edi, [ebp+20] ;3
    div edi
    pop ebp

;print
    push eax
    add eax, 0x30
    mov [out_buffer], eax
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    pop eax
    mov ecx, out_buffer
    int 0x80

exit:
    mov eax, 1
    int 0x80
