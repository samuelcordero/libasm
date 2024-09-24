section .text
    global ft_list_size

ft_list_size:
    xor     rax, rax        ; clear rax to store result
    cmp     rdi, 0
    je      .done

.loop:
    inc     rax
    mov     rdi, [rdi + 8]      ; move to next
    cmp     rdi, 0
    jne     .loop           ; if not null go to loop

.done:
    ret
