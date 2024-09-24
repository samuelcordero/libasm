section .text
    global ft_strcmp

ft_strcmp:
    xor     rax, rax      ; zero rax


.loop:
    mov     al, [rdi]
    mov     bl, [rsi]
    cmp     al, bl         ; compare if equal
    jne      .done         ; if not go to return
    cmp     al, 0          ; compare if null byte
    jne      .done         ; if not go to return
    inc     rdi
    inc     rsi
    jmp     .loop         ; go to loop

.done:
    mov     al, [rdi]
    mov     bl, [rsi]
    sub     al, bl
    movsx   rax, al
    ret
