default rel

global main
extern printf

section .rdata
    fmt1 db "sum_range(1, 5) = %d", 10, 0
    fmt2 db "triple(7) = %d", 10, 0
    fmt3 db "fib_iter(10) = %d", 10, 0

section .text

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov ecx, 1
    mov edx, 5
    call sum_range

    mov edx, eax
    lea rcx, [rel fmt1]
    call printf

    mov ecx, 7
    call triple

    mov edx, eax
    lea rcx, [rel fmt2]
    call printf

    mov ecx, 10
    call fib_iter

    mov edx, eax
    lea rcx, [rel fmt3]
    call printf

    xor eax, eax
    add rsp, 32
    pop rbp
    ret

sum_range:
    push rbp
    mov rbp, rsp

    xor eax, eax

.loop:
    cmp rcx, rdx
    ja .done
    add eax, ecx
    inc rcx
    jmp .loop

.done:
    pop rbp
    ret

triple:
    lea eax, [rcx + rcx*2]
    inc eax
    ret

fib_iter:
    xor eax, eax
    mov edx, 1

    test rcx, rcx
    jz .fib_done

.fib_loop:
    mov r8d, eax
    mov eax, edx
    add edx, r8d
    dec rcx
    jnz .fib_loop

.fib_done:
    ret
