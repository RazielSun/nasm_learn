; String length calc
strlen:
    push ebx
    mov ebx, eax
nextchar:
    cmp byte[eax], 0
    jz finished
    inc eax
    jmp nextchar
finished:
    sub eax, ebx
    pop ebx
    ret

sprint:
    push edx
    push ecx
    push ebx
    push eax
    call strlen

    mov edx, eax ; strlen ret value
    pop eax

    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 80h

    pop ebx
    pop ecx
    pop edx
    ret

; quit
quit:
    mov ebx, 0
    mov eax, 1
    int 80h