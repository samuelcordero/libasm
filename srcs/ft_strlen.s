section .text
    global ft_strlen

ft_strlen:
    xor     rax, rax    ; clear rax to store result

.loop:
    cmp     byte [rdi], 0 ; compare byte
    je      .done         ; if null go to return
    inc     rdi
    inc     rax
    jmp     .loop         ; go to loop

.done:
    ret
