global _start

%include '09_macro_functions.asm'

SECTION .data
msg1: db 'This is how we recycle in NASM.', 0Ah
msg2: db 'Hello, brave new world!', 0Ah, 0h ; Null terminating byte
msg3: db 'Third string for our program.', 0Ah, 0h

SECTION .text
_start:
    mov     eax, msg1
    call    sprint

    mov     eax, msg2
    call    sprint

    mov     eax, msg3
    call    sprint

    call    quit