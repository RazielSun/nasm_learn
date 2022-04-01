global _start

%macro pcall0 1
    call %1
%endmacro

%macro pcall1 2
    push %2
    call %1
    add esp, 4
%endmacro

%macro pcall2 3
    push %3
    push %2
    call %1
    add esp, 8
%endmacro

%macro pcall3 4
    push %4
    push %3
    push %2
    call %1
    add esp, 12
%endmacro

%define arg1 ebp+8
%define arg2 ebp+12
%define arg3 ebp+16
%define local1 ebp-4
%define local2 ebp-8
%define local3 ebp-12

%define arg(n) ebp+(4*n)+4
%define local(n) ebp-(4*n)

section .text
_start:
; exit
    mov     eax, 1
    mov     ebx, 0
    int     80h