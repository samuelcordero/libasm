section .text
    global ft_read

ft_read:
    mov     rax, 0         ; set rax to 0 (for read syscall)
    syscall                ; syscall to read
    ret
