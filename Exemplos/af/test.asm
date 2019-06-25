section .data
    v1 db 1

section .bss
    ;32-bit unsigned integer
    buffer resb 10

section .text
global _start
_start:
    mov byte[buffer], v1
    call mostrar_valor

exit:
    mov eax,1
    mov ebx,0
    int 0x80
; Conveter Inteiro para string
; Entrada: EAX ESI
; Saida EAX
int_to_string:
    add esi, 9
    mov byte [esi], 0
    mov ebx, 10
.prox_digito:
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax
    jnz .prox_digito ; eax == 0
    mov eax, esi
    ret

mostrar_valor:
    lea esi, [buffer]
    call int_to_string
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 10
    int 0x80
    ret
