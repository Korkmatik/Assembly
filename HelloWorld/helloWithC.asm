;--------------------------------------------------------
; Prints hello world on the console using a C library.
;
; Assemble:
;	nasm -felf64 helloWithC.asm && gcc helloWithC.o
;--------------------------------------------------------

	global main
	extern puts

	section .text
main:
	mov rdi, message
	call puts WRT ..plt
	ret

message:
	db "Hello World with C library!", 0
