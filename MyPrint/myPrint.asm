section .data
	text1 db "Hello World!", 10, 0
	text2 db "I Love Code!", 10, 0

section .text
	global _start

_start:
	; example usage of myPrint subroutine
	
	; example 1
	mov rax, text1
	call _myPrint
	
	; example 2
	mov rax, text2
	call _myPrint

	mov rax, 1
	mov rdi, 0
	syscall


; ======INPUT======
; RAX: pointer to string that should be printed
;      the string should be null terminated
; ======OUTPUT=====
; prints the given string
_myPrint:
	push rax
	mov rbx, 0
_myPrintLoop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _myPrintLoop

	; printing with syscall
	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall

	ret
