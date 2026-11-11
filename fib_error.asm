default rel

global main

section .text

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    call bad_frame

    xor eax, eax
    add rsp, 32
    pop rbp
    ret


bad_frame:
    push rbp
    mov rbp, rsp
    push rbx
    push rsi

    pop rsi
    pop rbx

bad_frame_ret:
    ret
