; this code is not compilable and for view purpose only

global _start

section .bss
mask resd 16

section .text
_start:
    xor eax, eax, ; eax = 0
    mov ecx, 16
    mov esi, mask
lp:
    mov [esi+ecx*4-4], eax ; fill mask to zero values
    loop lp
setelem:
    mov cl, bl
    and cl, 11111b ; binary 31 value
    mov eax, 1
    shl eax, cl
    mov edx, ebx
    shr edx, 5
    or [mask + 4*edx], eax
rmelem:
    mov cl, bl
    and cl, 11111b
    mov eax, 1
    shl eax, cl
    not eax ; invert mask
    mov edx, ebx
    shr edx, 5
    and [mask + 4*edx], eax
getelem:
    mov cl, bl
    and cl, 11111b
    mov eax, 1
    shl eax, cl
    mov edx, ebx
    shr edx, 5
    test [mask + 4*edx], eax ; ZF=1 elem is set, ZF=0 is not
countelems:
    xor ebx, ebx
    mov ecx, 16
.lp:
    mov eax, [mask+4*ecx]
.lp2:
    test eax, 1
    jz .notone
    inc ebx
.notone:
    shr eax, 1
    test eax, eax
    jnz .lp2
    jecxz .quit
    dec ecx
    jmp .lp
.quit