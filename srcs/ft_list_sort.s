section .text
    global ft_list_sort
    extern ft_list_size

ft_list_sort:
    push    r12
    push    r13
    push    r14
    push    r15
    push    rbx
    mov     r12, rdi        ; store **begin ptr
    mov     r13, rsi        ; store cmp funct addr
    mov     rdi, [rdi]      ; prepare args for list_size
    call    ft_list_size
    cmp     rax, 2
    jl      .done           ; if less than 2 elems no need to sort

.check_sort:
    mov     r14, [r12]      ; *begin at r14
    mov     rbx, r12

.check_sort_loop:
    cmp     qword [r14 + 8], 0  ; if next = NULL
    je      .done               ; all checked, go to end
    mov     rdi, [r14]          ; load data pointer from first elem to first operand to rdi
    mov     rsi, [r14 + 8]      ; same but second to rsi
    mov     rsi, [rsi]
    call    r13                 ; call cmp
    cmp     rax, 0              ; check res
    jg      .swap_elems         ; if second < first -> swap elems
    mov     rbx, r14
    add     rbx, 8
    mov     r14, [r14 + 8]      ; else go to next
    jmp     .check_sort_loop

.sort:
    mov     r14, [r12]
    mov     rbx, r12

.sort_loop:
    cmp     r14, 0
    je      .check_sort
    cmp     qword [r14 + 8], 0
    je      .check_sort
    mov     rdi, [r14]          ; load data pointer from first elem to first operand to rdi
    mov     rsi, [r14 + 8]      ; same but second to rsi
    mov     rsi, [rsi]
    call    r13
    cmp     rax, 0
    jg      .swap_elems
    mov     rbx, r14
    add     rbx, 8
    mov     r14, [r14 + 8]
.sort_loop_after_swap:
    jmp     .sort_loop

.swap_elems:
    mov     rax, [r14 + 8]      ; curr-next
    mov     r15, [rax + 8]      ; curr-next-next
    mov     [r14 + 8], r15      ; curr-next = curr-next-next
    mov     [rax + 8], r14      ; curr-next-next = curr
    mov     [rbx], rax          ; pointer to curr = curr-next
    mov     rbx, rax
    add     rbx, 8
    jmp     .sort_loop_after_swap

.done:
    pop     rbx
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    ret
