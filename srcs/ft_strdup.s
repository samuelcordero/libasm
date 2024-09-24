section .text
    global  ft_strdup
    extern  ft_strlen
    extern  malloc
    extern  ft_strcpy

ft_strdup:
    push    rbx
    mov     rsi, rdi
    mov     rbx, rdi
    call    ft_strlen
    mov     rdi, rax
    inc     rdi
    call    malloc
    cmp     rax, 0
    je      .mem_null
    mov     rdi, rax
    mov     rsi, rbx
    call    ft_strcpy
    pop     rbx
    ret

.mem_null:
    pop     rbx
    ret