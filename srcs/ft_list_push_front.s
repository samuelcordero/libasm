section .text
    global ft_list_push_front

ft_list_push_front:
    cmp     rdi, 0
    je      .done
    cmp     rsi, 0
    je      .done           ; if no list or no data return

    mov     rax, [rdi]      ; get list head
    mov     [rsi + 8], rax  ; data next = old head
    mov     [rdi], rsi      ; put data as new head

.done:
    ret
