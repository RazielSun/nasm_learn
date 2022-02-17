global _start

section .data

section .bss
buf_in resb 1024
buf_out resb 1024

section .text
_start:
    xor al, al
    mov esi, buf_in
    mov edi, buf_out
    mov ecx, 1024
    cld

    rep movsb ; rep is a repetition from ecx register, movs - move data from esi to edi

    mov eax, 1
    mov ebx, 0
    int 80h