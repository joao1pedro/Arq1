;A file copy program                                               file_copy.asm
;
;Objective: To copy a file using the int 0x80 services.
;    Input: Requests names of the input and output files.
;   Output: Creates a new output file and copies contents of the input file.

;%include "io.inc"

%define BUF_SIZE 256

section .data
;in_fn_prompt db 'Enter the input file name:',0
;out_fn_prompt db 'Enter the output file name:',0
;in_file_err_msg db 'Input file open error.',0
;out_file_err_msg db 'Cannot create output file.',0
in_file_name db "msg.txt",0
in_file_name_chave db "key.txt",0
out_file_name db "output.txt",0

section .bss
;in_file_name resb 30
;out_file_name resb 30
fd_in resd 1
fd_in_chave resd 1
fd_out resd 1
in_buf resd BUF_SIZE
in_buf_chave resd BUF_SIZE

section .text
global _start
_start:
    mov ebp, esp; for correct debugging
    ;PRINT_STRING in_fn_prompt
    ;GET_STRING in_file_name, 30
    ;PRINT_STRING out_fn_prompt
    ;GET_STRING out_file_name,30
    
    ;open the input file
    mov EAX, 5            ;file open
    mov EBX,in_file_name ;input file name pointer
    mov ECX, 0            ;access bits (read only)
    mov EDX, 0700         ;file permissions
    int 0x80
    mov [fd_in],EAX      ;store fd for use in read routine

    cmp EAX, 0
    jge read_key
 ;   PRINT_STRING in_file_err_msg
 ;   NEWLINE
    jmp done

read_key:    
;open the input file
    mov EAX,5            ;file open
    mov EBX,in_file_name_chave ;input file name pointer
    mov ECX,0            ;access bits (read only)
    mov EDX,0700         ;file permissions
    int 0x80
    mov [fd_in_chave],EAX      ;store fd for use in read routine

    cmp EAX, 0
    jge create_file
 ;   PRINT_STRING in_file_err_msg
 ;   NEWLINE
    jmp done
    
create_file:
;create output file
mov EAX,8                ;file create
mov EBX,out_file_name    ;output file name pointer
mov ECX,777             ;r/w/e by owner only
int 0x80
mov [fd_out],EAX         ;store fd for use in write routine
cmp EAX,0                ;create error if fd < 0
jge repeat_read
;PRINT_STRING out_file_err_msg
;NEWLINE
jmp close_exit

repeat_read:
; read input file key
    mov EAX,3             ;file read
    mov EBX, [fd_in_chave]      ;file deor
    mov ECX, in_buf_chave       ;input buffer
    mov EDX, BUF_SIZE     ;size
    int 0x80
;read file data
    mov EAX,3             ;file read
    mov EBX, [fd_in]      ;file deor
    mov ECX, in_buf       ;input buffer
    mov EDX, BUF_SIZE     ;size
    int 0x80
    ;criptografia
    mov ecx, eax
    xor esi, esi
    A:
    mov ebx, dword [in_buf+(esi)]
    add ebx, dword [in_buf_chave+(esi)]
    mov dword [in_buf+(esi)], ebx
    inc esi
    loop A

 ;write to output file
    mov EDX,EAX           ;byte count
    mov EAX,4             ;file write
    mov EBX,[fd_out]      ;file deor
    mov ECX,in_buf        ;input buffer
    int 0x80
    
    cmp EDX,BUF_SIZE      ; EDX = # bytes read
    jl  copy_done         ; EDX < BUF_SIZE indicates end-of-file
    
    jmp repeat_read
    
copy_done:
    mov EAX,6             ;close output file
    mov EBX,[fd_out]
    int 0x80
close_exit:   
    mov EAX,6             ;close input file
    mov EBX,[fd_in]
    int 0x80
done:
    mov ebx, 0 ;Error_code = 0 (OK)
    mov eax, 1
    int 0x80 ; Kernel


