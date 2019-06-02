section .data
    msg db "msg.txt", 0                         ;arquivo de com a mensagem que sera encriptada
    len equ $-msg
    key db "chave.txt", 0                       ;arquivo com a chave de encriptacao e decriptacao
    lenk equ $-key
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
    buffer resb len
    kbuffer resb lenk
    keyExtend resb len

section .text
global _start

_start:
    ;printar array
    ;mov esi, matriz
    ;mov edi, tam-1
    ;printArray:                                ;show array
    ;mov edx, 1
    ;mov ecx, [esi]
    ;add ecx, 48                                ;para converter pra ascii
    ;push ecx
    ;mov ecx, esp
    ;mov ebx, 1
    ;mov eax, 4
    ;int 80h
    ;pop ecx
    ;inc esi
    ;dec edi
    ;jns printArray

    openMSG:                                    ;open file for reading
    mov ebx, msg                                ; name of the msg  
    mov eax, 5  
    mov ecx, 0  
    int 80h    

    readMSG:                                    ;read from file
    mov eax, 3  
    mov ebx, eax
    mov ecx, buffer 
    mov edx, len    
    int 80h
    call close

    openKEY:
    mov ebx, key                                ; name of the msg  
    mov eax, 5  
    mov ecx, 0  
    int 80h  

    readKEY:                                    ;read from file
    mov eax, 3  
    mov ebx, eax
    mov ecx, kbuffer
    mov edx, lenk    
    int 80h
    call close
    
    mov esi, 0                                  ;percorrer o array da chave
    mov edi, 0
    mov edx, lenk                               ;tamanho da chave
    mov ecx, len                                ;tamanho da mensagem
    copy:
    mov ebx, [kbuffer+edi]                      ;move para edi caracter por caracter
    mov [keyExtend+esi], ebx                    ;move para key extend o caracter pego em cada iteração
    cmp ecx, 0
    je displayBuffer
    dec ecx
    inc esi
    inc edi
    jmp copy

    displayBuffer:                              ;write the message indicating end of file
    mov eax, 4  
    mov ebx, 1
    mov ecx, keyExtend
    mov edx, lenk
    int 80h
    call exit

    close:                                      ;close the file
    mov eax, 6  
    int 80h
    ret

    exit:                                       ;exit program
    mov eax, 1  
    mov ebx, 0 
    int 80h
