

section .data
msg1: db "This is a string", 0
msg2: db "long ", 0

section .bss
buf resb 256

section .text
global _start

_start:
    xor eax, eax
    mov edi, buf
    xor ecx, ecx
    cld
lp: ; copy from msg1 to buf
    mov al, [msg1 + ecx]
    stosb
    inc ecx
    cmp ecx, 16
    jl lp

    mov eax, 4
	mov ebx, 1
	mov ecx, buf
	mov edx, 16
	int 80h

    mov eax, 1
    mov ebx, 0
    int 80h