section .text
    global ft_strcpy

ft_strcpy:
    mov     rax, rdi      ; store rdi (dest) into rax

.loop:
    mov     dl, [rsi]    ; cpy from src to dl
    mov     [rdi], dl    ; cpy fromt dl to dest
    cmp     byte [rsi], 0 ; compare byte
    je      .done         ; if null go to return
    inc     rdi
    inc     rsi
    jmp     .loop         ; go to loop

.done:
    ret
