; ---------------------------------------------------
; prints "Hello World" on the console
; 
; Assemble: nasm -felf64 hello.asm && ld hello.o
;----------------------------------------------------

	global 	_main

	section .text

_start:	mov	rax, 1		; syscall for write
	mov 	rdi, 1		; setting file handle to stdout
	mov 	rsi, message	; pointer to string
	mov 	rdx, 12		; length of string
	syscall

	mov	rax, 60		; syscall for exit
	mov	rdi, 0		; setting exit code to 0
	syscall

	section .data
message: db	"Hello World", 10
