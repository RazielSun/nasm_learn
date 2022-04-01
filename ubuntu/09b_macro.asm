global _start

section .data
%assign n 50
%rep 100
        db n
    %assign n n+1
%endrep

section .text
_start:
    mov eax, 1
    mov ebx, 0
    int 80h