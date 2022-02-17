global _start

section .data
array resd 256

section .bss

section .text
_start:
    xor ebx, ebx
    mov esi, array
    mov ecx, 256
    cld
lp:
    lodsd   ; from array esi to AL/AX/EAX and inc ESI 1/2/4
    add ebx, eax
    loop lp

    mov eax, 1
    mov ebx, 0
    int 80h