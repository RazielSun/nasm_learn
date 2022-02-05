
global  _main
extern  _printf

section .text
_main:
        mov     ebp, 0
.again:
        push    message
        call    _printf
        add     esp, 4
        inc     ebp
        cmp     ebp, 5
        jl      .again
        ret

message: db  'Hello', 10, 0