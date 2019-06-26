section .data
	requestText: db 'Please enter integer!', 10 ;'text plus linefeed character'
	requestTextLen: equ $-requestText ;set the length of requestText.

section .bss	
	inputSum resb 4

section .text
	global _start

_start:	
	call askIntegerAndRead
	mov al, byte [inputSum] 	;Stores the first given value to esi.
	sub al, 48
	call askIntegerAndRead
	mov dl, byte [inputSum]
	sub dl, 48
	add al, dl			;Calculate the inputed sum.
	add eax, 48
	mov [inputSum], eax

	mov ecx, inputSum	;Set the inputSum address for write.	
	mov eax, 4		;The system call for write.	
	int 80h			;"Call" for write.

	call exit


;Asks for integer and reads from standard input.
askIntegerAndRead:
	mov eax, 4 		;The system call number for write (sys_write)
	mov ebx, 1 		;File descriptor 1 -standard output
	mov ecx, requestText 	;Copy the offset 
	mov edx, requestTextLen ;Copy the length to edx, is constant since defined equ so no need for []
	int 80h 		;Call the kernel by initiating the interrupt
	mov eax, 3		;The system call number for read (sys_read)
	mov ecx, inputSum		;ecx should contain the variables address for read value, here we set it
	int 80h
	ret

;Calls for exit for this process.
exit:
	mov eax, 1 		;System call number for exit (sys_exit)
	mov ebx, 0 		;Copy the return code for exit (0=no error)
	int 80h			;Call the kernel again :-)

