
global _start

section .bss
array resd 1000

section .text
_start:
    mov ecx, 1000
    mov esi, array
    mov eax, 0

    jecxz lpq ; if ecx is zero (not is our case but..)
lp:
    add eax, [esi]
    add esi, 4
    loop lp ; loop decreases counter register - ecx
lpq:
    mov eax, 1
    mov ebx, 0
    int 80h