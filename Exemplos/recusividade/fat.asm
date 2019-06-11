SECTION .bss
    prf resb 1

SECTION .text
global _start
_start:
    push 3
    call factorial
    
    add eax, 48
    mov [prf], eax

    mov ecx, prf
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80
exit:
    mov eax,1
    int 0x80

factorial:

    push ebp         ; Retrieve parameter and put it
    push ebx
    mov ebp,esp     ; into ebx register
    add ebp,12       ;
    mov ebx,[ebp]   ; ebx = Param

    cmp ebx,0       ; Check for base case
    je base        ; It is base if (n == 0)

    dec ebx         ; Decrement ebx to put it in the stack
    push ebx         ; Put (ebx - 1) in stack
    inc ebx         ; Restore ebx
    call factorial   ; Calculate factorial for (ebx - 1)
    mul ebx         ; eax = (eax * ebx) = (ebx - 1)! * ebx
    pop ebx         ; Retrieve ebx from the stack

    jmp end
base:               ; Base case
    mov eax,1       ; The result would be 1

end:
    pop ebx
    pop ebp         ; Release ebp
    ret
