section .data
	text db "Wrote your text to the specified file.",10

section .text
	global _start

; ====== USAGE =====
; ./write [filename] [data]
_start:

	; removing first two args
	pop rax
	pop rax

	; opening file
	mov rax, 2 ; SYS_OPEN = 2
	pop rdi
	mov rsi, 64+1 ; create and write only
	mov rdx, 0644o
	syscall

	; Getting length of input text
	mov rdi, [rsp]
	pop rsi
	mov rbx, 0

loop:
	mov cl, [rdi]
	inc rdi
	inc rbx
	cmp cl, 0
	jne loop

	; writing to file
	push rax
	mov rdi, rax
	mov rax, 1; sys_write
	mov rdx, rbx
	syscall

	; closing file
	mov rax, 3 ; sys_close
	pop rdi
	syscall

	; writing that file has been created
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 39
	syscall

	; exiting
	mov rax, 60
	mov rdi, 0
	syscall
