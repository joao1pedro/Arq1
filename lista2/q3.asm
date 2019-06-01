%include "io.inc"

section .data
    array db "pindamonhangaba",0
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
    mov eax, 0
    
    L1:
        movzx edx, byte[array+esi]
        inc esi 
        jmp la
        la:
            cmp edx, 'a'
            jne le
            inc eax
        le:
            cmp edx, 'e'
            jne li
            inc eax
        li:
            cmp edx, 'i'
            jne lo
            inc eax
        lo:
            cmp edx, 'o'
            jne lu
            inc eax
        lu:
            cmp edx, 'u'
            jne L2
        inc eax
        
    L2:
        loop L1
        jmp quit
        
        
    quit:
        PRINT_DEC 1, eax
        ret