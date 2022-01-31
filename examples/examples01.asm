;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NASM Win32 example: print result of X + Y
;
; Compilation:
; 1. Download NASM: https://www.nasm.us/
;    Recommended version: nasm-2.14.02-win64.zip
; 2. Download Tiny C Compiler: http://tinycc.org/
;    Recommended version: tcc-0.9.27-win64-bin.zip
; 3. Unpack it. For example: c:\soft\tcc, c:\soft\nasm
; 4. Compile: c:\soft\nasm\nasm.exe -felf nasm_ex_sum.asm
;    ELF is usually Linux format. But in our example we use TinyCC as a linker.
;    TinyCC understands only ELF object file, so we use it.
; 5. Link: c:\soft\tcc\tcc.exe -m32 nasm_ex_sum.o
;    By default, tcc expects to link 64bit executable,
;    so we need to specify 32-bit mode explicitly.
; 6. Run: nasm_ex_sum.exe
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .text

extern  printf, scanf
global  main

main:
    push    ebp
    mov     ebp, esp
    
    ; Allocate 8 bytes on stack for X and Y
    sub     esp, 8

    ; Input X
    push    str_input_x
    call    printf
    add     esp, 4
    lea     eax, [ebp - 4]
    push    eax
    push    str_format_num
    call    scanf
    add     esp, 8

    ; Input Y
    push    str_input_y
    call    printf
    add     esp, 4
    lea     eax, [ebp - 8]
    push    eax
    push    str_format_num
    call    scanf
    add     esp, 8

    ; Sum X + Y
    mov     eax, [ebp - 4] ; eax = X
    add     eax, [ebp - 8] ; eax += Y

    push    eax
    push    dword [ebp - 8]
    push    dword [ebp - 4]
    push    str_format_result
    call    printf
    add     esp, 16

    ; Exit status = 0
    xor     eax, eax

    pop     ebp
    mov     esp, ebp
    ret

str_input_x: db 'Input number X: ', 0
str_input_y: db 'Input number Y: ', 0
str_format_result: dd 'Result: %d + %d = %d', 10, 0
str_format_num: db '%d', 0