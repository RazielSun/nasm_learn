global _main

section .data
    count dd 256
    char db '@'
section .bss
    ch resb 256
section .text
_main:
    mov ecx, [count]
    mov edi, array
    mov al, [char]
.again:
    mov [edi], al
    inc edi
    dec ecx
    jnz .again