%include "io.inc"

section .data
    array db "hello wolrd",0
    size equ $-array

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    call Equal
    
    xor eax, eax
    ret
    
Equal:
    mov esi, 0
    mov ecx, size
    mov ebx, 'o'
    mov eax, 0
    
    L1:
        movzx edx, byte[array+esi]
        inc esi 
        cmp ebx, edx
        jne L2
        inc eax
        
    L2:
        loop L1
        jmp quit
        
        
    quit:
        PRINT_DEC 1, eax
        ret