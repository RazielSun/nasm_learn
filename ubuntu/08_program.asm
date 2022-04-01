global _start

section .data
message: db "message", 0
pattern: db "*", 0

section .bss

section .text
_start:
    push dword pattern
    push dword message
    call match
    add esp, 8 ; increase stack pointer

    mov eax, 1
    mov ebx, 0
    int 80h

match:
    push ebp        ; prepare stack frame
    mov ebp, esp
    sub esp, 4

    push esi
    push edi ; save registers

    mov esi, [ebp+8] ; from stack to esi, message
    mov edi, [ebp+12] ; pattern

.again:
    cmp byte[edi], 0 ; end of pattern?
    jne .not_end
    cmp byte[esi], 0 ; end of message?
    jne near .false
    jmp .true

.not_end:
    cmp byte[edi], '*'
    jne .not_star

    mov dword[ebp-4], 0

.star_loop:         ; prepare to recursion call
    mov eax, edi
    inc eax
    push eax    ; first arg

    mov eax, esi
    add eax, [ebp-4]
    push eax    ; second arg

    call match  ; recursion with new params

    add esp, 8  ; clear stack
    test eax, eax ; what we have recieved
    jnz .true

    add eax, [ebp-4]
    cmp byte[esi+eax], 0 ; end of string?
    je .false

    inc dword[ebp-4]
    jmp .star_loop

.not_star:
    mov al, [edi]
    cmp al, '?'
    je .quest
    cmp al, [esi]
    jne .false
    jmp .goon

.quest:
    cmp byte[esi], 0
    jz .false

.goon:
    inc esi
    inc edi
    jmp .again

.true:
    mov eax, 1
    jmp .quit ; skip false code

.false
    xor eax, eax ; set 0

.quit:          ; clear and restore registers
    pop edi
    pop esi
    mov esp, ebp
    pop ebp

    ret