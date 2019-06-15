section .data
    msg db "msg.txt",0        ;arquivo de com a mensagem que sera encriptada
    key db "key.txt",0      ;arquivo com a chave de encriptacao e decriptacao
    file_out db "saida.txt",0
    sizeMsg equ $-msg
    sizeKey equ $-key
    
section .bss
    buff resb 32                ;buffer
    chave resb 32       
;    chaveG resb sizeMsg
;    cifrado resb sizeMsg
;    decifrado resb sizeMsg
;    cif resb sizeMsg
    fd_in resb 1
    fd_out resb 1

section .text
global _start
_start:

openMsg:
    ;open file
    mov eax, 5                  ;open
    mov ebx, msg                ;file pointer
    mov ecx, 0                  ;read only
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

readMsg:
    ;read from file
    mov eax, 3
    mov ebx, [fd_in]
    mov ecx, buff
    mov edx, 32
    int 0x80

closeMsg:
    ;close key
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

openKey:
    ;open key
    mov eax, 5
    mov ebx, key
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

readKey:
    ;read key
    mov eax, 3
    mov ebx, [fd_in]
    mov ecx, chave
    mov edx, 32
    int 0x80

closeKey:
    ;close key
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

create_out:
;create file
    mov eax, 8
    mov ebx, file_out
    mov ecx, 0666q
    int 0x80

    mov [fd_out], eax

    ;write into file
    mov eax, 4
    mov edx, sizeMsg            ;tam
    mov ecx, buff
    mov ebx, [fd_out]
    int 0x80

closeOut:
    mov eax, 6
    mov ebx, [fd_out]

printMsg:
    ;print msg
    mov eax, 4
    mov ebx, 1
    mov ecx, buff
    mov edx, sizeMsg
    int 0x80

printKey:
    ;print key
    mov eax, 4
    mov ebx, 1
    mov ecx, chave
    mov edx, sizeKey
    int 0x80

;encrypt:
;    xor esi, esi
;    laco:
;    mov eax, [buff+(esi)]       ;eax = T[i]
;    mov ebx, [cif+(esi)]        ;eb = K[i]
;    mov ecx, sizeMsg            ;tam
;    add eax, ebx                ;eax = T[i]+K[i]

;    mov edi, 26                 ;mod(26)
;    modulo:
;    mov edx, 0
;    div edi
;    mov eax, edx
    
;    mov [cifrado+esi], eax
;    inc esi
;    loop laco

;decrypt:
;    xor esi, esi
;    laco2:
;    mov eax, [cifrado+(esi)]    ;eax = C[i]
;    mov ebx, [cif+(esi)]        ;eb = K[i]
;    mov ecx, sizeMsg            ;tam
;    sub eax, ebx                ;eax = T[i]+K[i]

;    mov edi, 26                ;mod(26)
;    mod:
;    mov edx, 0
;    div edi
;    mov eax, edx
    
;    mov [decifrado+esi], eax
;    inc esi
;    loop laco2

exit:
    ;exit
    mov eax, 1
    int 0x80
