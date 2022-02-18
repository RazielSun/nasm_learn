
section .data
msg: db "This is a string", 0

section .bss
buf resb 256

section .text
global _start

_start:
    xor eax, eax
    mov edi, msg
    xor ecx, ecx
    mov al, 'i'
    cld
    repnz scasb ; sca - is scan, repnz - repetition non zero in ZF
		
	mov eax, 4
	mov ebx, 1
	mov ecx, buf
	mov edx, 21
	int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
