section .text
    global  ft_strdup
    extern  ft_strlen           ; extern fucntions used
    extern  malloc
    extern  ft_strcpy

ft_strdup:
    push    rbx                 ; save rbx (callee saved)
    mov     rbx, rdi
    mov     rsi, rdi            ; prepare args for strlen
    call    ft_strlen
    mov     rdi, rax            ; use strlen res for malloc arg
    inc     rdi
    call    malloc
    cmp     rax, 0              ; check if malloc returned NULL
    je      .mem_null
    mov     rdi, rax            ; prepare args for strcpy
    mov     rsi, rbx
    call    ft_strcpy
    pop     rbx                 ; restore rbx
    ret                         ; result already stored in rax

.mem_null:
    pop     rbx                 ; restore rbx
    ret