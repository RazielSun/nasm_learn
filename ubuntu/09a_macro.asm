global _start



%define DEBUG_PRINT ; or: nasm -f elf -dDEBUG_PRINT prog.asm

section .text
_start:
%ifdef DEBUG_PRINT
    ; Print here
%endif

%ifdef FOR_PETROV
    ; code here
%elifdef FOR_SIDOROV
    ; ..
%else
    ; ..
    %error Please define either FOR_PETROV or FOR_SIDOROV
%endif
    mov eax, 1
    mov ebx, 0
    int 80h