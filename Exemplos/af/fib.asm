section .bss
    buffer resb 2
section .text
    global _start

_start:
    push 3

    call fib

    add eax, 48
    mov [buffer], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80
    
    ;exit
    mov eax, 1
    int 0x80

fib:
    push ebp    ;save ebp
    push ebx    ;save ebx
    mov ebp, esp    ;move ebp to esp current
    mov ebx, [ebp+12]   ;move ebx = 3 [epb+12]
    cmp ebx, 1      ;ebx <= 1?
    jle base    ; yes
    ;not
    lea ecx, [ebx-1]    ;ecx = pointer to ebx-1 (n-1)
    push ecx            ;ecx on stack (n-1)
    call fib
    pop ecx             ;restore ecx

    push eax            ;save eax
    lea ecx, [ebx-2]    ;pointer to n-2
    push ecx            ;save n-2 in stack
    call fib
    pop ecx             ;remove n-2
    pop ecx             ;remove n-1
    add eax, ecx        ;eax+ecx (n-1)+(n-2)

    jmp fim

base:
    mov eax, 1

fim:
    pop ebx
    pop ebp
    ret

