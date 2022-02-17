
global _start

section .text
_start:
	mov eax, 4 ; syscall write cmd
	mov ebx, 1
	mov ecx, message
	mov edx, 13
	int 80h
	mov eax, 1 ; syscall exit cmd
	mov ebx, 0 ; return 0
	int 80h

section .data
message: db "Hello, World", 10
