%include "io.inc"
section .data
    array db "texto",0
    size equ (($-array)-1)
    
section .text
global CMAIN
CMAIN:
    call transform
    xor eax, eax
    ret
    
transform:
    mov esi, 0
    mov ecx, size
    L1:
        mov edx, [array+esi] 
        sub edx, 32
        xchg edx, [array+esi]
        inc esi
        loop L1
        
   show: PRINT_STRING array
   ret