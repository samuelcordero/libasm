section .text
    global ft_strcpy

ft_strcpy:
    mov     rax, rdi      ; store rdi (dest) into rax

.loop:
    mov     bl, [rsi]    ; cpy from src to bl
    mov     [rdi], bl    ; cpy fromt bl to dest
    cmp     byte [rsi], 0 ; compare byte
    je      .done         ; if null go to return
    inc     rdi
    inc     rsi
    jmp     .loop         ; go to loop

.done:
    ret
