section .data
    msg db "msg.txt",0        ;arquivo de com a mensagem que sera encriptada
    key db "key.txt",0      ;arquivo com a chave de encriptacao e decriptacao
    file_out db "saida.txt",0
    matriz db "abcdefghijklmnopqrstuvwxyz",     ;linha1
           db "bcdefghijklmnopqrstuvwxyza",     ;linha2
           db "cdefghijklmnopqrstuvwxyzab",     ;linha3
           db "defghijklmnopqrstuvwxyzabc",     ;linha4
           db "efghijklmnopqrstuvwxyzabcd",     ;linha5
           db "fghijklmnopqrstuvwxyzabcde",     ;linha6
           db "ghijklmnopqrstuvwxyzabcdef",     ;linha7
           db "hijklmnopqrstuvwxyzabcdefg",     ;linha8
           db "ijklmnopqrstuvwxyzabcdefgh",     ;linha9
           db "jklmnopqrstuvwxyzabcdefghi",     ;linha10
           db "klmnopqrstuvwxyzabcdefghij",     ;linha11
           db "lmnopqrstuvwxyzabcdefghijk",     ;linha12
           db "mnopqrstuvwxyzabcdefghijkl",     ;linha13
           db "nopqrstuvwxyzabcdefghijklm",     ;linha14
           db "opqrstuvwxyzabcdefghijklmn",     ;linha15
           db "pqrstuvwxyzabcdefghijklmno",     ;linha16
           db "qrstuvwxyzabcdefghijklmnop",     ;linha17
           db "rstuvwxyzabcdefghijklmnopq",     ;linha18
           db "stuvwxyzabcdefghijklmnopqr",     ;linha19
           db "tuvwxyzabcdefghijklmnopqrs",     ;linha20
           db "uvwxyzabcdefghijklmnopqrst",     ;linha21
           db "vwxyzabcdefghijklmnopqrstu",     ;linha22
           db "wxyzabcdefghijklmnopqrstuv",     ;linha23
           db "xyzabcdefghijklmnopqrstuvw",     ;linha24
           db "yzabcdefghijklmnopqrstuvwx",     ;linha25
           db "zabcdefghijklmnopqrstuvwxy", 0   ;linha26
    tam equ $-matriz

section .bss
    buff resb 32     ;hold the value of one char
    chave resb 32
    chaveG resb 32
    fd_in resb 4
    fd_out resb 4

section .text
global _start
_start:

    ;open file
    mov eax, 5
    mov ebx, msg
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

    ;read from file
    mov eax, 3
    mov ebx, [fd_in]
    mov ecx, buff
    mov edx, 32
    int 0x80

    ;close the file
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

    ;open key
    mov eax, 5
    mov ebx, key
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

    ;read key
    mov eax, 3
    mov ebx, [fd_in]
    mov ecx, chave
    mov edx, 32
    int 0x80

    ;close key
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

    ;print msg
    mov eax, 4
    mov ebx, 1
    mov ecx, buff
    mov edx, 32
    int 0x80

    ;print key
    mov eax, 4
    mov ebx, 1
    mov ecx, chave
    mov edx, 32
    int 0x80

    ;exit
    mov eax, 1
    int 0x80
