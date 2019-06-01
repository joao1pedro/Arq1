section .data
    msg db "msg.txt", 0         ;arquivo de com a mensagem que sera encriptada
    len equ 1024
    key db "chave.txt", 0       ;arquivo com a chave de encriptacao e decriptacao
    lenk equ 1024
    matriz db 'abcdefghijklmnopqrstuvwxyzbcdefghijklmnopqrstuvwxyzacdefghijklmnopqrstuvwxyzabdefghijklmnopqrstuvwxyzabcefghijklmnopqrstuvwxyzabcdfghijklmnopqrstuvwxyzabcdeghijklmnopqrstuvwxyzabcdefhijklmnopqrstuvwxyzabcdefgijklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyzabcdefghiklmnopqrstuvwxyzabcdefghijlmnopqrstuvwxyzabcdefghijkmnopqrstuvwxyzabcdefghijklnopqrstuvwxyzabcdefghijklmopqrstuvwxyzabcdefghijklmnpqrstuvwxyzabcdefghijklmnoqrstuvwxyzabcdefghijklmnoprstuvwxyzabcdefghijklmnopqstuvwxyzabcdefghijklmnopqrtuvwxyzabcdefghijklmnopqrsuvwxyzabcdefghijklmnopqrstvwxyzabcdefghijklmnopqrstuwxyzabcdefghijklmnopqrstuvxyzabcdefghijklmnopqrstuvwyzabcdefghijklmnopqrstuvwxzabcdefghijklmnopqrstuvwxy', 0
    tam equ $-matriz

section .bss 
    buffer: resb 1024
    kbuffer: resb 1024

section .text
global _start

_start:
    openMSG:                    ;open file for reading
    mov ebx, msg                ; name of the msg  
    mov eax, 5  
    mov ecx, 0  
    int 80h    

    readMSG:                    ;read from file
    mov eax, 3  
    mov ebx, eax
    mov ecx, buffer 
    mov edx, len    
    int 80h
    call close

    openKEY:
    mov ebx, key                ; name of the msg  
    mov eax, 5  
    mov ecx, 0  
    int 80h  


    readKEY:                    ;read from file
    mov eax, 3  
    mov ebx, eax
    mov ecx, kbuffer
    mov edx, lenk    
    int 80h
    call close


    displayBuffer:              ;write the message indicating end of file
    mov eax, 4  
    mov ebx, 1
    mov ecx, buffer
    mov edx, len    
    int 80h
    call exit

    close:                      ;close the file
    mov eax, 6  
    int 80h
    ret

    ;printar array
    ;mov esi, matriz
    ;mov edi, tam-1
    ;printArray:                ;show array
    ;mov edx, 1
    ;mov ecx, [esi]
    ;add ecx, 48                ;para converter pra ascii
    ;push ecx
    ;mov ecx, esp
    ;mov ebx, 1
    ;mov eax, 4
    ;int 0x80
    ;pop ecx
    ;inc esi
    ;dec edi
    ;jns printArray

    exit:                       ;exit program
    mov eax, 1  
    mov ebx, 0 
    int 80h
