global _start

section .bss
array resb 256

section .text
_start:
	mov ecx, 256 ; set len of array to counter
	mov edi, array ; set address to destination index
	mov al, "@" ; set a lower 8bit of AX-16 EAX-32
.again:
	mov [edi], al
	inc edi
	dec ecx
	jnz .again
.done:
	mov eax, 1
	mov ebx, 0
	int 80h
