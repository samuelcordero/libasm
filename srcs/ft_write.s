section .text
    global ft_write
    extern __errno_location ; errno for syscall failure

ft_write:
    mov     rax, 1          ; set rax to 1 (for write syscall)
    syscall                 ; syscall to write
    test    rax, rax
    js      .syserror       ; if negative handle error
    ret

.syserror:
    neg     rax
    push    rbx
    mov     rbx, rax
    call    __errno_location
    mov     [rax], rbx
    mov     rax, -1
    pop     rbx
    ret
