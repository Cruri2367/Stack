default rel

global main
extern printf

section .rdata
    fmt db "fib(10) = %d", 10, 0

section .text

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov ecx, 4
    call fib

    mov edx, eax
    lea rcx, [rel fmt]
    call printf

    xor eax, eax
    add rsp, 32
    pop rbp
    ret


fib:
    push rbp
    mov rbp, rsp
    push rbx
    sub rsp, 40

    mov ebx, ecx

    cmp ebx, 1
    jbe .base_case

    lea ecx, [rbx - 1]
    call fib

    mov [rsp + 32], eax

    lea ecx, [rbx - 2]
    call fib

    add eax, [rsp + 32]
    jmp .fib_end

.base_case:
    mov eax, ebx

.fib_end:
    add rsp, 40
    pop rbx
    pop rbp
    ret
