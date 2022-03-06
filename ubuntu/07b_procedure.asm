global _start

section .data
msg: db "Hello, brave new World!", 0Ah

section .text
_start:
    mov eax, msg
    call strlen ;

    mov edx, eax
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h

strlen:
    push rbx ; ebx but in 64 mode
    mov ebx, eax
.nextchar:
    cmp byte[eax], 0
    jz .finished
    inc eax
    jmp .nextchar
.finished:
    sub eax, ebx
    pop rbx ; same
    ret
