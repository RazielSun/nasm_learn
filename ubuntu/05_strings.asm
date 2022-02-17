global _start

section .data

section .bss
buf resb 1024

section .text
_start:
    xor al, al ; zero for eax lower bit
    mov edi, buf ; di is destination index
    mov ecx, 1024
    cld ; clear set destination
lp:
    stosb   ; from al -> [edi] write data
    loop lp

    mov eax, 1
    mov ebx, 0
    int 80h