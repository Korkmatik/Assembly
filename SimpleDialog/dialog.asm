section .data
	textNameQuestion db "Hello! What is your name? "
	textHello db "Hello, "
	textAgeQuestion db "How old are you? "
	textAgeStart db "So you are "
	textAgeEnd db " years old."
	
section .bss
	name resb 20
	age resb 4

section .text
	global _start

_start:
	call _askName
	call _printHello
	call _askAge
	call _printAge

	mov rax, 60
	mov rdi, 0
	syscall

_askName:
	; print the question
	mov rax, 1
	mov rdi, 1
	mov rsi, textNameQuestion
	mov rdx, 26
	syscall

	; get user input
	mov rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 20
	syscall

	ret

_printHello:
	; print first part
	mov rax, 1
	mov rdi, 1
	mov rsi, textHello
	mov rdx, 7
	syscall

	; print name
	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 20
	syscall

	ret

_askAge:
	; print question
	mov rax, 1
	mov rdi, 1
	mov rsi, textAgeQuestion
	mov rdx, 17
	syscall

	; get user input
	mov rax, 0
	mov rdi, 0
	mov rsi, age
	syscall

	ret 

_printAge:
	; print first part of text
	mov rax, 1
	mov rdi, 1
	mov rsi, textAgeStart
	mov rdx, 11
	syscall

	; print age
	mov rax, 1
	mov rdi, 1
	mov rsi, age
	mov rdx, 4
	syscall

	; print last part of text
	mov rax, 1
	mov rdi, 1
	mov rsi, textAgeEnd
	mov rdx, 11
	syscall

	ret 
