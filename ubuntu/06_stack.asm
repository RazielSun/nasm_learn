global _start

section .data
msg: db "Hello, World", 10

section .bss
buf resb 256

section .text
_start:
    xor ebx, ebx
    xor ecx, ecx
    mov esi, msg
.lp:
    mov bl, [esi+ecx]
    cmp bl, 0
    je .lpquit
    push ebx
    inc ecx
    jmp .lp

.lpquit:
    jecxz .done
    mov edx, ecx ; save in edx string count for write cmd later
    mov edi, buf
.lp2:
    pop ebx
    mov [edi], bl
    inc edi
    loop .lp2

.print:
	mov eax, 4 ; syscall write cmd
	mov ebx, 1
	mov ecx, buf
;    mov edx, 13
	int 80h

.done:
    mov eax, 1 ; exit cmd with return 0 code
    mov ebx, 0
    int 80h