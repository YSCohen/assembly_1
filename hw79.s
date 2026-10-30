.text

# %rdi
# %rsi
# %rdx
# %rcx
# %r8
# %r9

    .globl relation_code
    .type relation_code, @function
relation_code:
    # DONE: Problem 1
    # %rdi  x
    # %rsi  y

    movq $0, %rax
    cmpq %rsi, %rdi

    jl p1_i_less
    jb p1_u_less

    p1_return:
        ret

    p1_i_less:
        addq $1, %rax
        cmpq %rsi, %rdi
        jb p1_u_less
        jmp p1_return

    p1_u_less:
        addq $2, %rax
        jmp p1_return


    .globl clamp_long
    .type clamp_long, @function
clamp_long:
    # DONE: Problem 2
    # %rdi  x
    # %rsi  low
    # %rdx  high

    cmpq %rsi, %rdi
    jl p2_low

    cmpq %rdx, %rdi
    jg p2_high

    movq %rdi, %rax
    ret

    p2_low:
        movq %rsi, %rax
        ret

    p2_high:
        movq %rdx, %rax
        ret


    .globl weighted_sum8
    .type weighted_sum8, @function
weighted_sum8:
    # DONE: Problem 3
    # %rdi     = a
    # %rsi     = b
    # %rdx     = c
    # %rcx     = d
    # %r8      = e
    # %r9      = f
    # 16(%rbp) = g
    # 24(%rbp) = h

    pushq %rbp
    movq %rsp, %rbp

    movq %rdi, %rax

    imulq $2, %rsi
    addq %rsi, %rax

    imulq $3, %rdx
    addq %rdx, %rax

    imulq $4, %rcx
    addq %rcx, %rax

    imulq $5, %r8
    addq %r8, %rax

    imulq $6, %r9
    addq %r9, %rax

    movq 16(%rbp), %rdi
    imulq $7, %rdi
    addq %rdi, %rax

    movq 24(%rbp), %rdi
    imulq $8, %rdi
    addq %rdi, %rax

    leave
    ret


    .globl alternating_sum
    .type alternating_sum, @function
alternating_sum:
    # DONE: Problem 4
    # %rdi = n
    # %rsi = i (loop i = 1..n)

    movq $0, %rax
    movq $1, %rsi

    p4_loop_plus_minus:
        cmpq %rdi, %rsi
        jg p4_return

        addq %rsi, %rax

        addq $1, %rsi
        cmpq %rdi, %rsi
        jg p4_return

        subq %rsi, %rax

        addq $1, %rsi
        jmp p4_loop_plus_minus

    p4_return:
        ret

    .globl recursive_power
    .type recursive_power, @function
recursive_power:
    # TODO: Problem 5
    movq $0, %rax
    ret

    .globl combine_helpers
    .type combine_helpers, @function
combine_helpers:
    # TODO: Problem 6
    movq $0, %rax
    ret

    .section .note.GNU-stack,"",@progbits
