global _start

section .data
message db "Hello, brave new world!", 10

section .text
_start:
	xor ebx, ebx ; zero ebx, we want to use bl 8bits
	xor ecx, ecx ; zero ecx
	mov esi, message ; memory address  to register 
.next:
	mov bl, [esi+ecx]
	cmp bl, 0
	je .done
	inc ecx
	jmp .next
.done:
	mov eax, 4
	mov ebx, 1
	mov edx, ecx
	mov ecx, message
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h

