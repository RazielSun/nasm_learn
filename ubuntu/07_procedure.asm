global _start

section .data

section .bss
array resb 256

section .text
_start:
    xor eax, eax
    mov al, '@'
    mov ecx, 256
    mov edi, array
    call fill_memory

    mov eax, 1
    mov ebx, 0
    int 80h

fill_memory: ; fill memory edi - dest address, eax (al) - item, ecx - count
    jecxz .fm_quit
.fm_loop:
    mov [edi], al
    inc edi
    loop .fm_loop
.fm_quit:
    ret