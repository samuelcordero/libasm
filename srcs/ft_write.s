section .text
    global ft_write

ft_write:
    mov     rax, 1         ; set rax to 1 (for write syscall)
    syscall                ; syscall to write
    ret
