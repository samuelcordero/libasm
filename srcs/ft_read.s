section .text
    global ft_read
    extern __errno_location ; for setting errno

ft_read:
    mov     rax, 0          ; set rax to 0 (for read syscall)
    syscall                 ; syscall to read
    test    rax, rax
    js      .syserror       ; if negative handle error
    ret

.syserror:
    neg     rax
    push    rbx
    mov     rbx, rax
    call    __errno_location wrt ..plt
    mov     [rax], rbx
    mov     rax, -1
    pop     rbx
    ret
