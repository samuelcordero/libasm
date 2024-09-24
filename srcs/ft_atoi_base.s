section .text
    global ft_atoi_base
    extern ft_strlen

ft_atoi_base:
    push    r12
    push    r13
    mov     r12, rdi                ; store str in callee saved reg
    mov     r13, rsi                ; store base in callee saved reg

.check_base:
    mov     rdi, r13
    call    ft_strlen               ; check base len
    cmp     rax, 2                  ; >=2
    jl      .error
    mov     rcx, r13
.check_spaces_base:                 ; check for no spaces, + or - sign in base
    cmp     byte [rcx], 0
    je      .done_check_spaces      ; loop end
    cmp     byte [rcx], 32          ; ' '
    je      .error
    cmp     byte [rcx], 43          ; '+'
    je      .error
    cmp     byte [rcx], 45          ; '-'
    je      .error
    inc     rcx
    jmp     .check_spaces_base

.done_check_spaces:
    mov     rcx, r13
.check_repeat_out:                  ; check no repeats
    cmp     byte [rcx], 0
    je      .checks_done            ; outter loop end
    mov     rdx, rcx
    inc     rdx
.check_repeat_in:
    cmp     byte [rdx], 0
    je      .check_repeat_in_end    ; inner loop end
    mov     r8b, byte [rcx]
    cmp     byte [rdx], r8b         ; if char twice in base error
    je      .error
    inc     rdx
    jmp     .check_repeat_in
.check_repeat_in_end:
    inc     rcx
    jmp .check_repeat_out

.checks_done:
    mov     rcx, r12                ; get str
    mov     rdi, rax                ; store base length (should still be in rax)
    xor     rax, rax                ; clear rax for res
.skip_spaces:
    cmp     byte [rcx], 32
    jne     .convert_start
    inc     rcx
    jmp    .skip_spaces
.convert_start:
    mov     r8, 1
.sign_loop:
    cmp     byte [rcx], 43
    je      .pos_sign
    cmp     byte [rcx], 45
    je      .neg_sign
    jmp    .convert_loop
.neg_sign
    neg     r8
.pos_sign
    inc     rcx
    jmp     .sign_loop
.convert_loop:
    cmp     byte [rcx], 0           ; if str end
    je      .end                    ; go to end
    mov     rdx, r13                ; get base
.convert_loop_in:
    cmp     byte [rdx], 0
    je      .end
    mov     sil, byte[rdx]
    cmp     sil, byte[rcx]
    je      .convert_loop_in_end
    inc     rdx
    jmp     .convert_loop_in
.convert_loop_in_end:
    sub     rdx, r13
    imul    rax, rdi
    add     rax, rdx
    inc     rcx
    jmp     .convert_loop

.end:
    imul    rax, r8
    pop     r13
    pop     r12
    ret

.error:
    mov     rax, 0
    pop     r13
    pop     r12
    ret
