global _start

section .data
array resd 256

section .bss

section .text
_start:
    xor ebx, ebx
    mov esi, array
    mov edi, esi
    mov ecx, 256
    cld
lp:
    lodsd
    inc eax
    stosd
    loop lp

    mov eax, 1
    mov ebx, 0
    int 80h