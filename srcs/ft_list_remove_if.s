section .text
    global ft_list_remove_if
    extern free

ft_list_remove_if:
    push    rbp
    mov     rbp, rsp
    push    r12
    push    r13
    push    r14
    push    r15
    push    rbx
    sub     rsp, 16         ; allocate for two 64 bit values
    mov     r12, rdi        ; store **begin ptr
    mov     [rsp + 8], rsi  ; store data ref addr in stack
    mov     r14, rdx        ; store cmp funct addr
    mov     r15, rcx        ; store free funct addr for data

.check_if:
    mov     r13, r12
    mov     r12, [r12]

.check_loop:
    cmp     r12, 0
    je      .done               ; if NULL return
    mov     rdi, [r12]          ; load data pointer from first elem to first operand to rdi
    mov     rsi, [rsp + 8]      ; load data ref adr
    call    r14                 ; call cmp funct
    cmp     rax, 0              ; if return == 0
    je      .remove_elem        ; remove elem
    mov     r13, r12
    add     r13, 8
    mov     r12, [r12 + 8]
.after_remove_data:             ; else continue
    jmp     .check_loop



.remove_elem:
    mov     rax, [r12 + 8]      ; curr-next
    mov     [r13], rax          ; prev-next = curr-next
    mov     [rsp], rax          ; save in stack for later
    mov     rdi, [r12]
    call    r15                 ; free data with data_free func
    mov     rdi, r12
    call    free                ; free node
    mov     r12, [rsp]          ; situate iterator to next node
    jmp     .after_remove_data

.done:
    pop     rbx
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    mov     rsp, rbp
    pop     rbp
    ret
