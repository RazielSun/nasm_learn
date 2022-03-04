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
    push edi
    push ecx
    push eax
    call fill_memory

    mov eax, 1
    mov ebx, 0
    int 80h

fill_memory: ; fill memory edi - dest address, eax (al) - item, ecx - count
    push ebp
    mov esp, ebp
    sub esp, 16 ; 16 is memory for local vars
    mov eax, [ebp+8]
    mov ecx, [ebp+12]
    mov edi, [ebp+16]
    jecxz .fm_quit
.fm_loop:
    mov [edi], al
    inc edi
    loop .fm_loop
.fm_quit:
    mov esp, ebp
    pop ebp
    ret