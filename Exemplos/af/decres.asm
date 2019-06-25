segment .data
  counter dd 10
  
segment	.bss
  buffer resb  12 ; 4
  
segment	.text
  global _start

  _start: 
  mov ecx, [counter]
  
  l1:
    push ecx
    dec dword [counter]
;    lea esi, [counter]
    lea esi, [buffer]
    mov eax, [counter]
    call int_to_string
    
;    mov [buffer], eax

    mov ecx, eax ; "begin print" position
    xor edx, edx
getlen:
    cmp byte [ecx + edx], 10
    jz gotlen
    inc edx
    jmp getlen
gotlen:
    inc edx
    
    mov	eax, 4
    mov	ebx, 1
;    mov	ecx, buffer
;    mov	edx, 10
    int	0x80
    
    pop ecx
  loop l1

  mov	eax, 1
  mov	ebx, 0
  int	0x80
  
  
int_to_string:
  add	esi, 9 ; counter + 9 ?
  mov	byte [esi], 10
  mov	ebx, 10         

.next_digit:
  xor	edx, edx        
  div	ebx             
  add	dl, '0'          
  dec	esi             
  mov	[esi],dl
  test	eax, eax            
  jnz	.next_digit
  mov	eax, esi
  ret
